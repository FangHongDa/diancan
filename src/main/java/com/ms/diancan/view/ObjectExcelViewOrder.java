package com.ms.diancan.view;

import com.ms.diancan.entity.vo.OrderExcelExportVO;
import com.ms.diancan.utils.ObjectExcelUtil;
import org.apache.poi.hssf.usermodel.*;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.util.CellRangeAddress;
import org.springframework.web.servlet.view.document.AbstractExcelView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Map;

/**
 * @author ms_miao
 * @createTime 2020-03-24 19:49
 */
public class ObjectExcelViewOrder extends AbstractExcelView {

    private String fileName;
    private String excelTitle;
    public ObjectExcelViewOrder(String fileName, String excelTitle){
        this.fileName = fileName;
        this.excelTitle = excelTitle;
    }
    @SuppressWarnings("deprecation")
    @Override
    protected void buildExcelDocument(Map<String, Object> model,
                                      HSSFWorkbook workbook, HttpServletRequest request,
                                      HttpServletResponse response) throws Exception {
        //Date date = new Date();
        //String filename = Tools.date2Str(date, "yyyyMMddHHmmss");
        HSSFSheet sheet =sheet = workbook.createSheet("sheet1");
        HSSFCell cell = getCell(sheet, 0, 0);
        response.setContentType("application/octet-stream;charset=utf-8");
        response.setHeader("Content-Disposition", "attachment;filename="+new String(fileName.getBytes(),"iso-8859-1")+".xls");

        //sheet.setAutoFilter(CellRangeAddress.valueOf("A2:AX2"));//设置筛选框

        //设置excel标题(合并居中)
        List<String> titles = (List<String>) model.get("titles");
        int len = titles.size();
        sheet.addMergedRegion(new CellRangeAddress(0, (short)0, 0, (short)(len-1)));
        HSSFCell titleCell = getCell(sheet, 0, 0);
        setText(titleCell,excelTitle);
        HSSFCellStyle titleStyle = workbook.createCellStyle();
        titleStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER); // 居中
        titleStyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
        HSSFFont titleFont=workbook.createFont();
        titleFont.setFontHeightInPoints((short)14);//字体大小
        titleFont.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);//字体加粗
        titleStyle.setFont(titleFont);
        titleCell.setCellStyle(titleStyle);
        //设置excel表头数据
        HSSFCellStyle headerStyle = workbook.createCellStyle(); //标题样式
        headerStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);
        headerStyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
        HSSFFont headerFont = workbook.createFont();	//标题字体
        headerFont.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
        headerFont.setFontHeightInPoints((short)11);
        headerStyle.setFont(headerFont);
        short width = 20,height=25*20;
        sheet.setDefaultColumnWidth(width);
        for(int i=0; i<len; i++){ //设置标题
            String title = titles.get(i);
            cell = getCell(sheet, 1, i);
            cell.setCellStyle(headerStyle);
            setText(cell,title);
        }

        sheet.getRow(0).setHeight(height);
        //设置具体每行文本数据
        HSSFCellStyle contentStyle = workbook.createCellStyle(); //内容样式
        contentStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);//水平居中
        contentStyle.setVerticalAlignment(CellStyle.VERTICAL_CENTER);//垂直居中
        //设置具体每行数值数据
        HSSFCellStyle valueStyle = workbook.createCellStyle(); //内容样式
        valueStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);//水平居中
        valueStyle.setVerticalAlignment(CellStyle.VERTICAL_CENTER);//垂直居中
        HSSFDataFormat df = workbook.createDataFormat();//此处设置数据格式  
        valueStyle.setDataFormat(df.getFormat("#,#0.0")); //小数点后保留两位，可以写contentStyle.setDataFormat(df.getFormat("#,#0.00"));  

        List<List<Object>> varList = (List<List<Object>>) model.get("varList");
        int varCount = varList.size();
        int rowIndex = 2;//第三行
        for(int i=0; i<varCount; i++){
            //初始参数
            OrderExcelExportVO data = (OrderExcelExportVO)varList.get(i);
            int colIndex = 0;//第一列
            //1-订单序号
            colIndex = ObjectExcelUtil.setSingleCellText(sheet,cell,rowIndex,colIndex,ObjectExcelUtil.showNullData(data.getId()),contentStyle);
            //2-订单编号
            colIndex = ObjectExcelUtil.setSingleCellText(sheet,cell,rowIndex,colIndex,ObjectExcelUtil.showNullData(data.getOrderId()),contentStyle);
            //3-订单金额
            colIndex = ObjectExcelUtil.setSingleCellText(sheet,cell,rowIndex,colIndex,ObjectExcelUtil.showNullData(data.getMoney()),contentStyle);
            //4-收货人
            colIndex = ObjectExcelUtil.setSingleCellText(sheet,cell,rowIndex,colIndex,ObjectExcelUtil.showNullData(data.getUserId()),contentStyle);
            //5-收获地址
            colIndex = ObjectExcelUtil.setSingleCellText(sheet,cell,rowIndex,colIndex,ObjectExcelUtil.showNullData(data.getAddressInfo()),contentStyle);
            //6-下单时间
            colIndex = ObjectExcelUtil.setSingleCellText(sheet,cell,rowIndex,colIndex,ObjectExcelUtil.showNullData(data.getOrderDate()),contentStyle);
            //7-订单状态
            colIndex = ObjectExcelUtil.setSingleCellText(sheet,cell,rowIndex,colIndex,ObjectExcelUtil.showNullData(data.getStatus()),contentStyle);
            rowIndex ++;
        }
    }
}