package com.arrcen.cdademo.controller;

import cn.hutool.core.date.DateUtil;
import cn.hutool.core.io.FileUtil;
import cn.hutool.core.util.ZipUtil;
import cn.hutool.log.Log;
import cn.hutool.log.LogFactory;
import cn.hutool.log.level.Level;
import com.arrcen.cdademo.pojo.GenericResponse;
import com.arrcen.cdademo.pojo.PatientCdaDocument;
import com.arrcen.cdademo.pojo.ResponseFormat;
import com.arrcen.cdademo.service.CDAgenerateService;
import com.google.common.collect.Lists;
import io.swagger.annotations.*;
import lombok.Data;
import org.apache.commons.io.IOUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedInputStream;
import java.io.File;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/cda/generate")
@Api(tags = "CDA文档生成相关接口", description = "提供CDA文档生成相关的api")
public class CDAgenerateController {
	@Autowired
	private CDAgenerateService generateService;

	private static final Log log = LogFactory.get();

	@PostMapping("/createPersonalDoc")
	@ApiOperation("通过模板序号和用户id生成对应的CDA文档")
	public GenericResponse getXml(@RequestBody List<DocInfo> docInfos, HttpServletRequest request) {
		try {
			log.info(log.getName() + "/createPersonalDoc", Level.INFO);
			List<String> list = Lists.newArrayList();
			for (DocInfo docInfo : docInfos) {
				String index = docInfo.getIndex();
				String systemId = docInfo.getSystemId();
				if (StringUtils.isEmpty(index) || StringUtils.isEmpty(systemId)) {
					return ResponseFormat.retParam(0, "缺失模板序号/用户id", null);
				}
				String xml = generateService.getXml(index, systemId, request);
				list.add(xml);
			}
			return ResponseFormat.retParam(1, list);
		} catch (Exception e) {
			log.error(e, log.getName() + "/createPersonalDoc", Level.ERROR);
			return ResponseFormat.retParam(-1, null);
		}
	}

	@GetMapping("/getList")
	@ApiOperation("查询分页后的文档信息列表")
	public GenericResponse getList(@RequestParam(value = "templateIndex") @ApiParam(value = "模板序号", required = true) String templateIndex,
								   @RequestParam(value = "page", defaultValue = "1", required = false) @ApiParam(value = "当前页码", example = "1") int page,
								   @RequestParam(value = "size", defaultValue = "10", required = false) @ApiParam(value = "每页记录数", example = "10") int size,
								   @RequestParam(value = "sort", defaultValue = "ASC", required = false) @ApiParam(value = "排序方式(升序ASC,降序DESC)") String order,
								   @RequestParam(value = "properties", defaultValue = "系统序号", required = false) @ApiParam(value = "排序字段") String properties,
								   @RequestParam(value = "startTime", required = false) @ApiParam(value = "查询条件:起始日期") String startTime,
								   @RequestParam(value = "endTime", required = false) @ApiParam(value = "查询条件:截止日期") String endTime,
								   @RequestParam(value = "systemId", required = false) @ApiParam(value = "查询条件:系统序号(精确匹配)") String systemId,
								   @RequestParam(value = "EMPI", required = false) @ApiParam(value = "查询条件:患者主索引(暂不可用)") String EMPI,
								   @RequestParam(value = "patientId", required = false) @ApiParam(value = "查询条件:身份证号(精确匹配)") String patientId,
								   @RequestParam(value = "patientName", required = false) @ApiParam(value = "查询条件:姓名(精确匹配)") String patientName) {

		try {
			log.info(log.getName() + "/getList", Level.INFO);
			Map<String, Object> map = generateService.getPage(templateIndex, page, size, order, properties, startTime, endTime, systemId, patientId, patientName);
			return ResponseFormat.retParam(1, map);
		} catch (Exception e) {
			log.error(e, log.getName() + "/getList/templateIndex:{}", templateIndex, Level.ERROR);
			return ResponseFormat.retParam(-1, null);
		}
	}


	@PostMapping("/upload")
	@ApiOperation(value = "上传文件")
	public GenericResponse upload(@RequestParam(value = "file") @ApiParam(value = "文件", required = true) List<MultipartFile> files) {
		try {
			log.info(log.getName() + "/upload", Level.INFO);
			for (MultipartFile file : files) {
				if (!file.isEmpty()) {
					generateService.uploadFile(file);
				}
			}
			return ResponseFormat.retParam(1, "上传成功", null);
		} catch (RuntimeException e) {
			log.error(e, log.getName() + "/upload", Level.ERROR);
			return ResponseFormat.retParam(-1, "校验未通过", null);
		} catch (Exception e) {
			log.error(e, log.getName() + "/upload", Level.ERROR);
			return ResponseFormat.retParam(-1, null);
		}
	}

	@PostMapping("/download")
	@ApiOperation(value = "下载文件")
	public void download(@RequestBody @ApiParam(value = "文件信息", required = true) PatientCdaDocument doc,
						 HttpServletResponse response) {
		File file = null;
		try {
			log.info(log.getName() + "/download", Level.INFO);
			file = generateService.download(doc);
			response.setContentType("application/octet-stream");
			response.setHeader("Content-Disposition", "attachment;filename=\"" + doc.getDocname() + "\"");
			BufferedInputStream inputStream = FileUtil.getInputStream(file);
			IOUtils.copy(inputStream, response.getOutputStream());
			response.flushBuffer();
			inputStream.close();
		} catch (Exception e) {
			log.error(e, log.getName() + "/download/docId:{}", doc.getDocid(), Level.ERROR);
			response.setStatus(-1);
		} finally {
			if (file != null) {
				FileUtil.del(file.toPath());
			}
		}
	}

	@PostMapping("/downloadFiles")
	@ApiOperation(value = "批量下载")
	public void downloadFiles(@RequestBody @ApiParam(value = "文件信息", required = true) List<PatientCdaDocument> docs,
							  HttpServletResponse response) {
		log.info(log.getName() + "/downloadFiles", Level.INFO);
		File dir = FileUtil.mkdir("D://cda//" + DateUtil.format(DateUtil.date(), "yyyyMMddHHmmss"));
		File zip = null;
		try {
			for (PatientCdaDocument doc : docs) {
				generateService.download(doc, dir.getPath());
			}
			zip = ZipUtil.zip(dir.getPath());
			response.setContentType("application/octet-stream");
			response.setHeader("Content-Disposition", "attachment;filename=\"" + zip.getName() + "\"");
			BufferedInputStream inputStream = FileUtil.getInputStream(zip);
			IOUtils.copy(inputStream, response.getOutputStream());
			response.flushBuffer();
			inputStream.close();
		} catch (Exception e) {
			log.error(e, log.getName() + "/downloadFiles", Level.ERROR);
			response.setStatus(-1);
		} finally {
			FileUtil.del(dir.toPath());
			if (zip != null) {
				FileUtil.del(zip.toPath());
			}
		}
	}

	@ApiModel
	@Data
	static class DocInfo {
		@ApiModelProperty(value = "模板序号")
		String index;
		@ApiModelProperty(value = "用户id")
		String systemId;
	}
}
