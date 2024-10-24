package com.ms.diancan.entity.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author ms_miao
 * @createTime 2020-03-24 19:42
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class OrderExcelExportVO {

    private Integer id;
    private String orderId;
    private Double money;
    private Integer userId;
    private String addressInfo;
    private String orderDate;
    private Integer status;
}
