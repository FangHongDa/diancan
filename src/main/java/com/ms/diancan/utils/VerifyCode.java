package com.ms.diancan.utils;

import com.ms.diancan.entity.Order;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.*;
import java.util.Random;

/**
 * 动态生成图片
 */
public class VerifyCode {
	// {"宋体", "华文楷体", "黑体", "华文新魏", "华文隶书", "微软雅黑", "楷体_GB2312"}
	private static String[] fontNames = { "宋体", "华文楷体", "黑体", "微软雅黑",  "楷体_GB2312" };
	// 可选字符
	//"23456789abcdefghjkmnopqrstuvwxyzABCDEFGHJKMNPQRSTUVWXYZ";
	private static String codes = "23456789abcdefghjkmnopqrstuvwxyzABCDEFGHJKMNPQRSTUVWXYZ";
	// 背景色
	private Color bgColor = new Color(255, 255, 255);
	// 基数(一个文字所占的空间大小)
	private int base = 30;
	// 图像宽度
	private int width = base * 4;
	// 图像高度
	private int height = base;
	// 文字个数
	private int len = 4;
	// 设置字体大小
	private int fontSize = 22;
	// 验证码上的文本
	private String text;

	private BufferedImage img = null;
	private Graphics2D g2 = null;

	/**
	 * 生成验证码图片
	 */
	public void drawImage(OutputStream outputStream) {
		// 1.创建图片缓冲区对象, 并设置宽高和图像类型
		img = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
		// 2.得到绘制环境
		g2 = (Graphics2D) img.getGraphics();
		// 3.开始画图
		// 设置背景色
		g2.setColor(bgColor);
		g2.fillRect(0, 0, width, height);

		StringBuffer sb = new StringBuffer();// 用来装载验证码上的文本

		for (int i = 0; i < len; i++) {
			// 设置画笔颜色 -- 随机
			// g2.setColor(new Color(255, 0, 0));
			g2.setColor(new Color(getRandom(0, 150), getRandom(0, 150),getRandom(0, 150)));

			// 设置字体
			g2.setFont(new Font(fontNames[getRandom(0, fontNames.length)], Font.BOLD, fontSize));

			// 旋转文字(-45~+45)
			int theta = getRandom(-45, 45);
			g2.rotate(theta * Math.PI / 180, 7 + i * base, height - 8);

			// 写字
			String code = codes.charAt(getRandom(0, codes.length())) + "";
			g2.drawString(code, 7 + i * base, height - 8);
			sb.append(code);
			g2.rotate(-theta * Math.PI / 180, 7 + i * base, height - 8);
		}

		this.text = sb.toString();

		// 画干扰线
		for (int i = 0; i < len + 2; i++) {
			// 设置画笔颜色 -- 随机
			// g2.setColor(new Color(255, 0, 0));
			g2.setColor(new Color(getRandom(0, 150), getRandom(0, 150),
					getRandom(0, 150)));
			g2.drawLine(getRandom(0, 120), getRandom(0, 30), getRandom(0, 120),
					getRandom(0, 30));
		}

		g2.setColor(Color.GRAY);
		g2.drawRect(0, 0, width-1, height-1);

		// 4.保存图片到指定的输出流
		try {
			ImageIO.write(this.img, "JPEG", outputStream);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}finally{
			// 5.释放资源
			g2.dispose();
		}
	}

	/**
	 * 获取验证码字符串
	 * @return
	 */
	public String getCode() {
		return this.text;
	}

	/*
	 * 生成随机数的方法
	 */
	private static int getRandom(int start, int end) {
		Random random = new Random();
		return random.nextInt(end - start) + start;
	}

	public static void main(String[] args) throws Exception {
		VerifyCode vc = new VerifyCode();
		vc.drawImage(new FileOutputStream("e:/vc.jpg"));
		System.out.println("执行成功~!");
	}





//	//打印报表
//	public static void writeToDisk(java.util.List<Order> list, int maxrow, String fileName) throws IOException {
//	   /*
//	    * @param list: 保存数据的list列表
//	    * @param maxrow:每页Excel的行数
//	    */
//		//1生成sheet1
//		HSSFWorkbook wb=new HSSFWorkbook();
//		//判断页数0~page
//		int page=list.size()/maxrow;
//		if(list.size()%maxrow!=0){
//			page++;
//		}
//
//
//
//		//判断最后一页的行数
//		int lastPageRowNum=list.size()%maxrow;
//
//
//		for(int i=0;i<page;i++){//创建每页的页表头
//			String sheetName = "sheet" + i;//sheet1,2,3,4
//			HSSFSheet sheet1 = wb.createSheet(sheetName);
//			sheet1.autoSizeColumn(1);
//			//2 生成sheet1的第一行,放表头信息
//			HSSFRow row = sheet1.createRow(0);
//			/*
//			 * 3 设置第一行的第一个单元格："序号"
//			 *
//			 */
//			HSSFCell cell1 = row.createCell(0);
//			cell1.setCellValue("订单编号");
//
//
//			cell1 = row.createCell(1);
//			cell1.setCellValue("商品名称");
//
//			cell1 = row.createCell(2);
//			cell1.setCellValue("数量");
//			cell1 = row.createCell(3);
//			cell1.setCellValue("总价格");
//			cell1 = row.createCell(4);
//			cell1.setCellValue("订单时间");
//			cell1 = row.createCell(5);
//			cell1.setCellValue("食品类型");
//			cell1 = row.createCell(6);
//			cell1.setCellValue("联系电话");
//			cell1 = row.createCell(7);
//			cell1.setCellValue("收货地址");
//			cell1 = row.createCell(8);
//			cell1.setCellValue("状态");
//
//
//		}
//		/*前面几页都是满行，最后一页有可能不是满行，所以分开处理*/
//
//		//为page-1页赋值
//		int index = 0;
//		for (int m = 0; m < page - 1; m++) {//处理页数0到倒数第二页
//			int rowIndex = 1;//每页都要重置行数1开始到max-1
//			//sheetName
//			String sheetName = "sheet" + m;
//			HSSFSheet sheet1 = wb.getSheet(sheetName);
//			//具体插入数据
//			for (int j = index; j < index + maxrow; j++) {//1~29行,30~59,60~89,
//				//为sheet赋值
//				HSSFRow rowInfo = sheet1.createRow(rowIndex);//创建1到size行，添加数据
//				/* 创建每一行单元格
//				 * 获取每一行的所有单元格
//				 * 获取对应的数据
//				 */
//				rowInfo.createCell(0);
//				HSSFCell cell = rowInfo.getCell(0);
//
//				cell.setCellValue(list.get(j).getOrderId());
//
//				rowInfo.createCell(1);
//				cell = rowInfo.getCell(1);
//				if (list.get(j) != null) {
//					cell.setCellValue(list.get(j).getProduct().getProductName());
//				} else {
//					cell.setCellValue("null");
//				}
//
//				rowInfo.createCell(2);
//				cell = rowInfo.getCell(2);
//				cell.setCellValue(list.get(j).getProductOrder().getBuyNum());
//
//				rowInfo.createCell(3);
//				cell = rowInfo.getCell(3);
//				cell.setCellValue(list.get(j).getMoney());
//
//				rowInfo.createCell(4);
//				cell = rowInfo.getCell(4);
//				cell.setCellValue(list.get(j).getOrderDate());
//
//				rowInfo.createCell(5);
//				cell = rowInfo.getCell(5);
//				cell.setCellValue(list.get(j).getProduct().getProductKind().getKindName());
//
//				rowInfo.createCell(6);
//				cell = rowInfo.getCell(6);
//				cell.setCellValue(list.get(j).getUser().getUserInfo().getTelephone());
//
//				rowInfo.createCell(7);
//				cell = rowInfo.getCell(7);
//				cell.setCellValue(list.get(j).getUser().getUserInfo().getAddress());
//
//				rowInfo.createCell(8);
//				cell = rowInfo.getCell(8);
//				if ("-1".equals(list.get(j).getOrderStatus())) {
//					cell.setCellValue("买家待付款");
//				} else if ("0".equals(list.get(j).getOrderStatus())) {
//					cell.setCellValue("已付款、去发货");
//				} else if ("1".equals(list.get(j).getOrderStatus())) {
//					cell.setCellValue("已发货，待收货");
//				}else if ("2".equals(list.get(j).getOrderStatus())) {
//					cell.setCellValue("已收货，待评价");
//				}else if ("3".equals(list.get(j).getOrderStatus())) {
//					cell.setCellValue("去回复评论");
//				}else{
//					cell.setCellValue("订单完成 ");
//				}
//				rowIndex++;
//			}
//			index = index + maxrow;
//		}
//
//		//为page(即最后一页)赋值
//		String sheetName = "sheet" + (page - 1);
//		HSSFSheet sheet1 = wb.getSheet(sheetName);
//		int index1 = 0;
//		for (int n = index; n < index + lastPageRowNum; n++) {  //90~100,余数页
//			/* 创建每一行单元格
//			 * 获取每一行的所有单元格
//			 * 获取对应的数据
//			 */
//			HSSFRow rowInfo = sheet1.createRow(index1);     //创建1到lastPageRowNum行，添加数据
//			rowInfo = sheet1.getRow(index1);
//			rowInfo.createCell(0);
//			HSSFCell cell = rowInfo.getCell(0);
//			cell.setCellValue(list.get(n).getOrderId());
//			rowInfo.createCell(1);
//			cell = rowInfo.getCell(1);
//			if (list.get(n) != null) {
//				cell.setCellValue(list.get(n).getProduct().getProductName());
//			} else {
//				cell.setCellValue("null");
//			}
//			rowInfo.createCell(2);
//			cell = rowInfo.getCell(2);
//			cell.setCellValue(list.get(n).getProductOrder().getBuyNum());
//			rowInfo.createCell(3);
//			cell = rowInfo.getCell(3);
//			cell.setCellValue(list.get(n).getMoney());
//			rowInfo.createCell(4);
//			cell = rowInfo.getCell(4);
//			cell.setCellValue(list.get(n).getOrderDate());
//			rowInfo.createCell(5);
//			cell = rowInfo.getCell(5);
//			//cell.setCellValue(list.get(n).getProduct().getProductKind().getName());
//			rowInfo.createCell(6);
//			cell = rowInfo.getCell(6);
//			if ("0".equals(list.get(n).getOrderStatus())) {
//				cell.setCellValue("已付款、去发货");
//			} else if ("1".equals(list.get(n).getOrderStatus())) {
//				cell.setCellValue("已发货，待收货");
//			} else if ("2".equals(list.get(n).getOrderStatus())) {
//				cell.setCellValue("已收货，待评价");
//			} else if ("3".equals(list.get(n).getOrderStatus())) {
//				cell.setCellValue("去回复评论");
//			} else {
//				cell.setCellValue("订单完成");
//			}
//			index1++;
//		}
//		//工具输出流
//		ByteArrayOutputStream os = new ByteArrayOutputStream();
//		try {
//			wb.write(os);
//		} catch (Exception e) {
//			// TODO: handle exception
//			e.printStackTrace();
//		}
//		byte[] content = os.toByteArray();
//		String name = fileName + ".xls";
//		System.out.print(name);
//		File file = new File(name);
//		if (file.exists()) {
//			System.out.println(file.getPath());
//			System.out.println("文件已经存在!");
//		} else {
//			file.createNewFile();
//		}
//		OutputStream fos = null;
//		try {
//			fos = new FileOutputStream(file);
//			fos.write(content);
//			os.close();
//			fos.close();
//		} catch (Exception e) {
//		}
//	}
}
