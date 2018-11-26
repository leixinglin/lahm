package com.lhh.common;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSON;
import com.lhh.dao.SysDataDao;
import com.lhh.pojo.SysData;
import com.lhh.utils.Tools;

@Service
public class ReadExcel {
	// 总行数
	private int totalRows = 0;
	// 总条数
	private int totalCells = 0;
	// 错误信息接收器
	private String errorMsg;

	// 构造方法
	public ReadExcel() {
	}

	// 获取总行数
	public int getTotalRows() {
		return totalRows;
	}

	// 获取总列数
	public int getTotalCells() {
		return totalCells;
	}

	// 获取错误信息
	public String getErrorInfo() {
		return errorMsg;
	}

	/**
	 * 读EXCEL文件，获取信息集合
	 * 
	 * @param fielName
	 * @return
	 */
	public List<SysData> getExcelInfo(MultipartFile mFile) {
		String fileName = mFile.getOriginalFilename();// 获取文件名
		List<SysData> dataList = null;
		try {
			if (!validateExcel(fileName)) {// 验证文件名是否合格
				return null;
			}
			boolean isExcel2003 = true;// 根据文件名判断文件是2003版本还是2007版本
			if (isExcel2007(fileName)) {
				isExcel2003 = false;
			}
			dataList = createExcel(mFile.getInputStream(), isExcel2003);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dataList;
	}

	/**
	 * 根据excel里面的内容读取客户信息
	 * 
	 * @param is
	 *            输入流
	 * @param isExcel2003
	 *            excel是2003还是2007版本
	 * @return
	 * @throws IOException
	 */
	public List<SysData> createExcel(InputStream is, boolean isExcel2003) {
		List<SysData> dataList = null;
		try {
			Workbook wb = null;
			if (isExcel2003) {// 当excel是2003时,创建excel2003
				wb = new HSSFWorkbook(is);
			} else {// 当excel是2007时,创建excel2007
				wb = new XSSFWorkbook(is);
			}
			dataList = readExcelValue(wb);// 读取Excel里面客户的信息
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dataList;
	}

	/**
	 * 读取Excel里面客户的信息
	 * 
	 * @param wb
	 * @return
	 */
	private List<SysData> readExcelValue(Workbook wb) {
		// 得到第一个shell
		Sheet sheet = wb.getSheetAt(0);
		// 得到Excel的行数
		this.totalRows = sheet.getPhysicalNumberOfRows();
		// 得到Excel的列数(前提是有行数)
		if (totalRows > 1 && sheet.getRow(0) != null) {
			this.totalCells = sheet.getRow(0).getPhysicalNumberOfCells();
		}
		List<SysData> dataList = new ArrayList<SysData>();
		SysData content = null;
		// 循环Excel行数
		for (int r = 1; r < totalRows; r++) {
			Row row = sheet.getRow(r);
			if (row == null) {
				continue;
			}
			//System.out.println(r);
			content = new SysData();
			// 循环Excel的列
			for (int c = 0; c < this.totalCells; c++) {
				Cell cell = row.getCell(c);
				if (null != cell) {
					switch (c) {
					case 0:
						//System.out.println(cell.getCellType());
						content.setCreateTime(Tools.excelTime(cell));
						break;
					case 1:
						content.setChannel(String.valueOf(cell));
						break;
					case 2:
						content.setActive(Integer.parseInt(String.valueOf(cell).substring(0, (String.valueOf(cell).indexOf(".")))));
						break;
					}
				}
			}
			dataList.add(content);
		}
		return dataList;
	}
	
	 public static void exportExcel(List<SysData> dataList, OutputStream outputStream) throws IOException {
	        //1.创建工作簿
		 XSSFWorkbook hwb =new XSSFWorkbook();
	        //1.1创建合并单元格
	        //CellRangeAddress cellRangeAddress =new CellRangeAddress(0,0,0,4);
	        //2.创建工作表
	        XSSFSheet sheet = hwb.createSheet("用户信息表");

	        //2.1添加合并单元格
	        //sheet.addMergedRegion(cellRangeAddress);
	        //3.1创建第一行及单元格
	        //3.2创建第二行及单元格
	        XSSFRow row2 = sheet.createRow(0);
	        String[] row2Cell = {"时间","渠道","激活数"};
	        for (int i =0 ; i < row2Cell.length ; i++ ){
	            row2.createCell(i).setCellValue(row2Cell[i]);
	        }
	        //3.3创建第三行及单元格
	        if(dataList!= null && dataList.size()>0){
	            for(int j=0 ; j<dataList.size() ;j++){
	                XSSFRow rowUser = sheet.createRow(j+1);
	                XSSFCell cell=rowUser.createCell(0);
	                cell.setCellType(Cell.CELL_TYPE_NUMERIC);
	                cell.setCellValue(dataList.get(j).getCreateTime());
	                rowUser.createCell(1).setCellValue(dataList.get(j).getChannel());
	                rowUser.createCell(2).setCellValue(dataList.get(j).getActive());
	                //rowUser.createCell(4).setCellValue(userList.get(j).getId());
	            }
	        }
	        //5.输出
	        hwb.write(outputStream);
	    }

	/**
	 * 验证EXCEL文件
	 * 
	 * @param filePath
	 * @return
	 */
	public boolean validateExcel(String filePath) {
		if (filePath == null || !(isExcel2003(filePath) || isExcel2007(filePath))) {
			errorMsg = "文件名不是excel格式";
			return false;
		}
		return true;
	}

	// @描述：是否是2003的excel，返回true是2003
	public static boolean isExcel2003(String filePath) {
		return filePath.matches("^.+\\.(?i)(xls)$");
	}

	// @描述：是否是2007的excel，返回true是2007
	public static boolean isExcel2007(String filePath) {
		return filePath.matches("^.+\\.(?i)(xlsx)$");
	}
}