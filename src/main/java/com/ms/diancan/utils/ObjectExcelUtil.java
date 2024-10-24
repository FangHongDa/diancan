package com.ms.diancan.utils;

/* *
 *@Description:
 *@Author:TYJ
 *@Date: create in  2019/9/9 17:23
 */

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.ss.util.CellRangeAddress;

public class ObjectExcelUtil {

    //1-1-1-设置单个单元格文本数据
    public  static int setSingleCellText(HSSFSheet sheet, HSSFCell cell, int rowIndex, int colIndex, Object value, HSSFCellStyle contentStyle){
        cell = getCell(sheet, rowIndex, colIndex);
        cell.setCellStyle(contentStyle);
        setText(cell,String.valueOf(value));
        colIndex ++;
        return colIndex;
    }
    //1-1-2-设置单个单元格文本数据
    public  static int setSingleCellValue(HSSFSheet sheet, HSSFCell cell, int rowIndex, int colIndex, Object value, HSSFCellStyle contentStyle){
        cell = getCell(sheet, rowIndex, colIndex);
        //cell.setCellFormula(Cell.CELL_TYPE_NUMERIC);
        cell.setCellStyle(contentStyle);
        if(value != null){
            setNumeric(cell,Double.parseDouble(String.valueOf(value)));
        }
        colIndex ++;
        return colIndex;
    }
    //1-2-1-设置合并单元格文本数据
    public static int setMergedCellText(HSSFSheet sheet, HSSFCell cell, int rowIndex, int colIndex, int orderSize, Object value, HSSFCellStyle contentStyle){
        sheet.addMergedRegion(new CellRangeAddress(rowIndex, (short)(rowIndex+orderSize-1), colIndex, (short)colIndex));
        return setSingleCellText(sheet,cell,rowIndex,colIndex, value,contentStyle);
    }
    //1-2-2-设置合并单元格数值数据
    public static int setMergedCellValue(HSSFSheet sheet, HSSFCell cell, int rowIndex, int colIndex, int orderSize, Object value, HSSFCellStyle contentStyle){
        sheet.addMergedRegion(new CellRangeAddress(rowIndex, (short)(rowIndex+orderSize-1), colIndex, (short)colIndex));
        return setSingleCellValue(sheet,cell,rowIndex,colIndex, value,contentStyle);
    }

    //1-3-null数据处理
    public static Object showNullData(Object data){
        return data==null?"":data;
    }

    public static void setNumeric(HSSFCell cell, Double text) {
        cell.setCellType(HSSFCell.CELL_TYPE_NUMERIC);
        cell.setCellValue(text);
    }

    //本类私有方法
    private static HSSFCell getCell(HSSFSheet sheet, int row, int col) {
        HSSFRow sheetRow = sheet.getRow(row);
        if (sheetRow == null) {
            sheetRow = sheet.createRow(row);
        }
        HSSFCell cell = sheetRow.getCell(col);
        if (cell == null) {
            cell = sheetRow.createCell(col);
        }
        return cell;
    }

    private static void setText(HSSFCell cell, String text) {
        cell.setCellType(HSSFCell.CELL_TYPE_STRING);
        cell.setCellValue(text);
    }
}
