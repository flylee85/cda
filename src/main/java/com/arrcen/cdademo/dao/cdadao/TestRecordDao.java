package com.arrcen.cdademo.dao.cdadao;

import com.arrcen.cdademo.pojo.cdapojo.TestRecord;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface TestRecordDao extends JpaRepository<TestRecord,String> {
    TestRecord findBy门急诊号(String 门急诊号);

    @Query(value = "SELECT 值含义 FROM PUB_卫生数据元值域 WHERE 值域名称 = '患者类型代码表' and 值=?1",nativeQuery = true)
	String find患者类型By患者类型代码(String 患者类型代码);

    @Query(value = "select 代码名称 from PUB_ICD10 where 代码类型 = '诊断代码表(ICD_10)' AND 代码值=?1",nativeQuery = true)
	String find疾病诊断名称By疾病诊断名称(String 疾病诊断编码);
}
