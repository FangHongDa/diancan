package com.ms.diancan.entity.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author ms_miao
 * @createTime 2020-04-29 21:57
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class OrderStatusCountVO {

    private Integer orderStatus;
    private Integer count;
}
