#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include "boots.h"
#include "bts_debug.h"
#include "bts_cnt.h"

#include "naga_types.h"
#include "mask.h"

mask_rule_tab_t  rule_tab;

berr mask_rule_add(uint32_t id,  uint32_t mask, naga_acl_t *acl)
{
    if(id >= MAX_MASK_RULE || acl == NULL) 
    {
        return E_PARAM;
    }
    
    mask_rule_t *rule = &(rule_tab.rules[id]);
   
    rule->id = id;
    rule->mask = mask;

    memcpy(&rule->acl, acl, sizeof(naga_acl_t));
    rule->used = 1;

    if(id >= rule_tab.inuse)
    {
        rule_tab.inuse = id +1;
    }

    return E_SUCCESS;
}

mask_rule_t * mask_rule_get(uint32_t id)
{
    if(id >= MAX_MASK_RULE) 
    {
        return NULL;
    }    

    return &(rule_tab.rules[id]);   
}


berr mask_rule_del(uint32_t id)
{
    if(id >= MAX_MASK_RULE) 
    {
        return E_PARAM;
    }
    
    memset(&rule_tab.rules[id], 0, sizeof(mask_rule_t));

    return E_SUCCESS;
}


berr naga_mask(hytag_t *hytag)
{
    int i;
    mask_rule_t *rule = NULL;

	CNT_INC(MASK_PKTS);

    if (NULL == hytag) {
        CNT_INC(MASK_PARAM);
        return E_PARAM;
    }

    if (hytag->acl.mask == 0) {
        CNT_INC(MASK_ZERO);
        return E_SUCCESS;
    }

    CNT_INC(MASK_NOTZERO);

    printf("%s.%d: mask=0x%x\n", __func__, __LINE__, hytag->acl.mask);

    for (i = 0; i < rule_tab.inuse; i++) 
    {
        rule = &rule_tab.rules[i];

        if (0 == rule->used) {
            continue;
        }

        if (rule->mask == (rule->mask & hytag->acl.mask)) {
            ACL_HIT(rule->acl);
            HYTAG_ACL_MERGE(hytag->acl, rule->acl);
            CNT_INC(MASK_MATCHED);

            if (DOPT_IS_SELECTED(DOPT_MASK_URL)) 
            {
                printf("\nDOPT: mask_url %14s.%-6d ===================================================================\n", __func__, __LINE__);
                printf("ORI_URL:\n");
                naga_url_dump(&hytag->ori_url);
                printf("\nREF_URL:\n");
                naga_url_dump(&hytag->ref_url);
                printf("\nREDIR_URL:%s\n", hytag->acl.url); 
                printf("--------------------------------------------------------------------------------------------------------\n");
            }
            return E_SUCCESS; 
        }
    }

    CNT_INC(MASK_DISMATCH);

	return E_SUCCESS;
}

/* End of file */
