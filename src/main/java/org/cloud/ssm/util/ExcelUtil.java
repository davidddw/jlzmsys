package org.cloud.ssm.util;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.lang.reflect.Method;
import java.net.URLEncoder;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFPalette;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.web.multipart.MultipartFile;

public class ExcelUtil<T> {

	private static final String titleFontType = "Arial Unicode MS";
	private static final short titleFontSize = 12;
	// 表头背景色
	private static final String titleBackColor = "C1FBEE";
	private static final String contentFontType = "Arial Unicode MS";
	private static final short contentFontSize = 12;
	// 表头字号
	// 添加自动筛选的列 如 A:M
	private static final String address = "";

	/**
	 * 获取workbook
	 * 
	 * @param inStr
	 * @param fileName
	 * @return
	 * @throws Exception
	 */
	private static Workbook getWorkbook(InputStream inStr, String fileName) throws Exception {
		Workbook wb = null;
		String fileType = fileName.substring(fileName.lastIndexOf("."));
		if (".xls".equals(fileType)) {
			wb = new HSSFWorkbook(inStr);
		} else if (".xlsx".equals(fileType)) {
			wb = new XSSFWorkbook(inStr);
		} else {
			throw new Exception("解析的文件格式有误!");
		}
		return wb;
	}

	/**
	 * 获取指定字段的字符串表示
	 * 
	 * @param cell
	 * @return
	 */
	private static String getCellValue(Cell cell) {
		String value = "";
		switch (cell.getCellTypeEnum()) {
		case STRING:
			value = cell.getStringCellValue();
			break;
		case NUMERIC:
			if (HSSFDateUtil.isCellDateFormatted(cell)) {
				Date date = cell.getDateCellValue();
				if (null != date) {
					value = new SimpleDateFormat("yyyy-MM-dd").format(date);
				} else {
					value = "";
				}
			} else {
				value = new DecimalFormat("0").format(cell.getNumericCellValue());
			}
			break;
		case BOOLEAN:
			value = cell.getBooleanCellValue() == true ? "true" : "false";
			break;
		case BLANK:
			value = "";
			break;
		default:
			break;
		}
		return value;
	}

	/**
	 * EXCEL表格导入
	 * 
	 * @param filename
	 * @param ignoreRows
	 * @param columnNum
	 * @return
	 * @throws Exception
	 */
	public static <T> List<T> getObjectListFromExcel(MultipartFile file, int ignoreRows, int columnNum, 
			String[] titleColumn, Class<T> clazz) throws Exception {
		List<List<String>> rowList = getData(file, ignoreRows, columnNum);
		List<T> returnList = new ArrayList<T>();
		for (List<String> columnList : rowList) {
			T obj = clazz.newInstance();
			Method[] methods = clazz.getDeclaredMethods();
			for (int i = 0; i < titleColumn.length; i++) {
				for (Method m : methods) {
					if (m.getName().startsWith("set")) {
						String methodName = titleColumn[i];
						StringBuffer sb = new StringBuffer(methodName);
						sb.replace(0, 1, (methodName.charAt(0) + "").toUpperCase());
						methodName = "set" + sb.toString();
						if (methodName.equals(m.getName())) {
							m.invoke(obj, columnList.get(i));
							break;
						}
					}
				}
			}
			returnList.add(obj);
		}
		System.out.println("size=" + returnList.size());
		return returnList;
	}

	/**
	 * EXCEL表格导入
	 * 
	 * @param filename
	 * @param ignoreRows
	 * @param columnNum
	 * @return
	 * @throws Exception
	 */
	public static List<List<String>> getData(MultipartFile file, int ignoreRows, int columnNum) throws Exception {
		Workbook work = getWorkbook(file.getInputStream(), file.getOriginalFilename());
		List<List<String>> result = new ArrayList<>();
		Cell cell = null;
		for (int sheetIndex = 0; sheetIndex < work.getNumberOfSheets(); sheetIndex++) {
			Sheet sheet = work.getSheetAt(sheetIndex);
			for (int rowIndex = ignoreRows; rowIndex <= sheet.getLastRowNum(); rowIndex++) {
				Row row = sheet.getRow(rowIndex);
				if (null == row) {
					continue;
				}
				String[] values = new String[columnNum];
				Arrays.fill(values, "");
				for (int columnIndex = 0; columnIndex < columnNum; columnIndex++) {
					cell = row.getCell(columnIndex);
					if (cell == null) {
						values[columnIndex] = "";
					} else {
						values[columnIndex] = getCellValue(cell);
					}
				}
				result.add(Arrays.asList(values));
			}
		}
		return result;
	}

	/**
	 * 设置字体并加外边框
	 * 
	 * @param style
	 *            样式
	 * @param style
	 *            字体名
	 * @param style
	 *            大小
	 * @return
	 */
	private static CellStyle setFontAndBorder(HSSFWorkbook workbook, CellStyle style, String fontName, short size) {
		HSSFFont font = workbook.createFont();
		font.setFontHeightInPoints(size);
		font.setFontName(fontName);
		font.setBold(false);
		style.setFont(font);

		style.setBorderBottom(BorderStyle.THIN); // 下边框
		style.setBorderLeft(BorderStyle.THIN);// 左边框
		style.setBorderTop(BorderStyle.THIN);// 上边框
		style.setBorderRight(BorderStyle.THIN);// 右边框
		return style;
	}

	/**
	 * 将16进制的颜色代码写入样式中来设置颜色
	 * 
	 * @param style
	 *            保证style统一
	 * @param color
	 *            颜色：66FFDD
	 * @param index
	 *            索引 8-64 使用时不可重复
	 * @return
	 */
	public static CellStyle setColor(HSSFWorkbook workbook, CellStyle style, String color, short index) {
		if (color != "" && color != null) {
			// 转为RGB码
			int r = Integer.parseInt((color.substring(0, 2)), 16); // 转为16进制
			int g = Integer.parseInt((color.substring(2, 4)), 16);
			int b = Integer.parseInt((color.substring(4, 6)), 16);
			// 自定义cell颜色
			HSSFPalette palette = workbook.getCustomPalette();
			palette.setColorAtIndex((short) index, (byte) r, (byte) g, (byte) b);

			style.setFillPattern(FillPatternType.SOLID_FOREGROUND);
			style.setFillForegroundColor(index);
		}
		return style;
	}

	/**
	 * EXCEL表格导出
	 * 
	 * @param titles
	 * @param list
	 * @return
	 */
	public final static <T> Workbook export(String[] titleColumn, String[] titleName, List<T> dataList) {
		HSSFWorkbook wb = new HSSFWorkbook();
		Sheet sheet = wb.createSheet("sheet1");
		sheet.autoSizeColumn(1);
		try {
			// 写入excel的表头
			Row row = sheet.createRow(0);
			// 设置样式
			HSSFCellStyle titleStyle = wb.createCellStyle();
			titleStyle = (HSSFCellStyle) setFontAndBorder(wb, titleStyle, titleFontType, (short) titleFontSize);
			titleStyle = (HSSFCellStyle) setColor(wb, titleStyle, titleBackColor, (short) 10);

			for (int i = 0; i < titleName.length; i++) {
				Cell cell = row.createCell(i);
				cell.setCellStyle(titleStyle);
				cell.setCellValue(titleName[i].toString());
			}

			// 为表头添加自动筛选
			if (!"".equals(address)) {
				CellRangeAddress c = (CellRangeAddress) CellRangeAddress.valueOf(address);
				sheet.setAutoFilter(c);
			}

			// 通过反射获取数据并写入到excel中
			if (dataList != null && dataList.size() > 0) {
				HSSFCellStyle dataStyle = wb.createCellStyle();
				dataStyle = (HSSFCellStyle) setFontAndBorder(wb, dataStyle, contentFontType, (short) contentFontSize);
				if (titleColumn.length > 0) {
					for (int rowIndex = 1; rowIndex <= dataList.size(); rowIndex++) {
						Object obj = dataList.get(rowIndex - 1); // 获得该对象
						Class<?> clsss = obj.getClass(); // 获得该对对象的class实例
						Row dataRow = sheet.createRow(rowIndex);
						for (int columnIndex = 0; columnIndex < titleColumn.length; columnIndex++) {
							String title = titleColumn[columnIndex].toString().trim();
							if (!"".equals(title)) { // 字段不为空
								// 使首字母大写
								String UTitle = Character.toUpperCase(title.charAt(0))
								        + title.substring(1, title.length()); // 使其首字母大写;
								String methodName = "get" + UTitle;

								// 设置要执行的方法
								Method method = clsss.getDeclaredMethod(methodName);
								// 获取返回类型
								String returnType = method.getReturnType().getName();

								String data = method.invoke(obj) == null ? "" : method.invoke(obj).toString();
								Cell cell = dataRow.createCell(columnIndex);
								cell.setCellStyle(dataStyle);
								if (data != null && !"".equals(data)) {
									if ("int".equals(returnType)) {
										cell.setCellValue(Integer.parseInt(data));
									} else if ("long".equals(returnType)) {
										cell.setCellValue(Long.parseLong(data));
									} else if ("float".equals(returnType)) {
										cell.setCellValue(new DecimalFormat(".00").format(Float.parseFloat(data)));
									} else if ("double".equals(returnType)) {
										cell.setCellValue(new DecimalFormat(".00").format(Double.parseDouble(data)));
									} else {
										cell.setCellValue(data);
									}
								}
							}
						}
					}
				}
			}
			return wb;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 
	 * @param filename
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	public static String getFileName(String filename) throws UnsupportedEncodingException {
		String fileNameString = filename == null || filename.equals("") ? "一覧" : filename;
		return new String((fileNameString + new SimpleDateFormat("yyyy-MM-dd").format(new Date())).getBytes(), "UTF-8");
	}

	/**
	 * 
	 * @param is
	 * @param out
	 * @throws IOException
	 */
	public static void write(InputStream is, ServletOutputStream out) throws IOException {
		BufferedInputStream bis = null;
		BufferedOutputStream bos = null;
		try {
			bis = new BufferedInputStream(is);
			bos = new BufferedOutputStream(out);
			byte[] buff = new byte[2048];
			int bytesRead;
			while (-1 != (bytesRead = bis.read(buff, 0, buff.length))) {
				bos.write(buff, 0, bytesRead);
			}
		} catch (final IOException e) {
			throw e;
		} finally {
			if (bis != null)
				bis.close();
			if (bos != null)
				bos.close();
		}
	}

	/**
	 * 
	 * @param titles
	 * @param list
	 * @param excelFileName
	 * @param response
	 * @throws IOException
	 */
	public final static <T> void export(String[] columns, String[] titles, List<T> list, String excelFileName,
	        HttpServletResponse response) throws IOException {
		String fileName = getFileName(excelFileName);
		ByteArrayOutputStream os = new ByteArrayOutputStream();
		export(columns, titles, list).write(os);
		byte[] content = os.toByteArray();
		InputStream is = new ByteArrayInputStream(content);
		response.reset();
		response.setContentType("application/x-msdownload");
		response.setHeader("Content-disposition", "attachment;filename=" + URLEncoder.encode(fileName, "utf-8")
		        + ".xls");
		ServletOutputStream out = response.getOutputStream();
		write(is, out);
	}
}
