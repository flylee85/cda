<?xml version="1.0" encoding="UTF-8"?>
<ClinicalDocument xmlns="urn:hl7-org:v3" xmlns:mif="urn:hl7-org:v3/mif"
                  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                  xsi:schemaLocation="urn:hl7-org:v3 ..\sdschemas\SDA.xsd">
    <realmCode code="CN"/>
    <typeId root="2.16.840.1.113883.1.3" extension="POCD_MT000040"/>
    <templateId root="2.16.156.10011.2.1.1.35"/>
    <!-- 文档流水号 -->
    <id root="2.16.156.10011.1.1" extension=""/>
    <code code="C0015" codeSystem="2.16.156.10011.2.4" codeSystemName="卫生信息共享文档规范编码体系"/>
    <title>阴道分娩记录</title>
    <!-- 文档机器生成时间 -->
    <effectiveTime value=""/>
    <confidentialityCode code="N" codeSystem="2.16.840.1.113883.5.25" codeSystemName="Confidentiality"
                         displayName="正常访问保密级别"/>
    <languageCode code="zh-CN"/>
    <setId/>
    <versionNumber/>
    <recordTarget typeCode="RCT" contextControlCode="OP">
        <patientRole classCode="PAT">
            <!-- 住院号标识 -->
            <id root="2.16.156.10011.1.12" extension=""/>

            <patient classCode="PSN" determinerCode="INSTANCE">
                <!-- 患者身份证号标识 -->
                <id root="2.16.156.10011.1.3" extension="${patient.patientId!}"/>
                <!-- 患者姓名 -->
                <name>${patient.patientName!}</name>
                <age unit="岁" value=""/>
            </patient>
        </patientRole>
    </recordTarget>
    <!-- 文档创作者 -->
    <author typeCode="AUT" contextControlCode="OP">
        <time value=""/>
        <assignedAuthor classCode="ASSIGNED">
            <id root="2.16.156.10011.1.7" extension=""/>
            <!-- 医师姓名 -->
            <assignedPerson>
                <name>${patient.archiverName!}</name>
            </assignedPerson>
        </assignedAuthor>
    </author>
    <!-- 保管机构 -->
    <custodian typeCode="CST">
        <assignedCustodian classCode="ASSIGNED">
            <representedCustodianOrganization classCode="ORG" determinerCode="INSTANCE">
                <id root="2.16.156.10011.1.5" extension=""/>
                <name></name>
            </representedCustodianOrganization>
        </assignedCustodian>
    </custodian>

    <authenticator>
        <!-- 签名日期时间 -->
        <time value=""/>
        <signatureCode/>
        <assignedEntity>
            <id root="2.16.156.10011.1.4" extension=""/>
            <code displayName="接生者"/>
            <assignedPerson>
                <name>${patient.archiverName!}</name>
            </assignedPerson>
        </assignedEntity>
    </authenticator>

    <authenticator>
        <!-- 签名日期时间 -->
        <time value=""/>
        <signatureCode/>
        <assignedEntity>
            <id root="2.16.156.10011.1.4" extension=""/>
            <code displayName="助产者"/>
            <assignedPerson>
                <name>${patient.archiverName!}</name>
            </assignedPerson>
        </assignedEntity>
    </authenticator>

    <authenticator>
        <!-- 签名日期时间 -->
        <time value=""/>
        <signatureCode/>
        <assignedEntity>
            <id root="2.16.156.10011.1.4" extension=""/>
            <code displayName="助手"/>
            <assignedPerson>
                <name>${patient.archiverName!}</name>
            </assignedPerson>
        </assignedEntity>
    </authenticator>

    <authenticator>
        <!-- 签名日期时间 -->
        <time value=""/>
        <signatureCode/>
        <assignedEntity>
            <id root="2.16.156.10011.1.4" extension=""/>
            <code displayName="护婴者"/>
            <assignedPerson>
                <name>${patient.archiverName!}</name>
            </assignedPerson>
        </assignedEntity>
    </authenticator>

    <authenticator>
        <!-- 签名日期时间 -->
        <time value=""/>
        <signatureCode/>
        <assignedEntity>
            <id root="2.16.156.10011.1.4" extension=""/>
            <code displayName="指导者"/>
            <assignedPerson>
                <name>${patient.archiverName!}</name>
            </assignedPerson>
        </assignedEntity>
    </authenticator>

    <authenticator>
        <!-- 签名日期时间 -->
        <time value=""/>
        <signatureCode/>
        <assignedEntity>
            <id root="2.16.156.10011.1.4" extension=""/>
            <code displayName="记录人"/>
            <assignedPerson>
                <name>${patient.archiverName!}</name>
            </assignedPerson>
        </assignedEntity>
    </authenticator>

    <participant typeCode="NOT">
        <!-- 联系人 -->
        <associatedEntity classCode="ECON">
            <!-- 联系人电话 -->
            <telecom value="${patient.participantTelecom!}"/>
            <!-- 联系人 -->
            <associatedPerson>
                <!-- 姓名 -->
                <name>${patient.participantName!}</name>
            </associatedPerson>
        </associatedEntity>
    </participant>

    <relatedDocument typeCode="RPLC">
        <parentDocument>
            <id/>
            <setId/>
            <versionNumber/>
        </parentDocument>
    </relatedDocument>

    <!-- 病床号、病房、病区、科室和医院的关联 -->
    <componentOf>
        <encompassingEncounter>
            <!-- 入院日期时间 -->
            <effectiveTime/>
            <location>
                <healthCareFacility>
                    <serviceProviderOrganization>
                        <asOrganizationPartOf classCode="PART">
                            <!-- DE01.00.026.00 病床号 -->
                            <wholeOrganization classCode="ORG" determinerCode="INSTANCE">
                                <id root="2.16.156.10011.1.22" extension=""/>
                                <name></name>
                                <!-- DE01.00.019.00 病房号 -->
                                <asOrganizationPartOf classCode="PART">
                                    <wholeOrganization classCode="ORG" determinerCode="INSTANCE">
                                        <id root="2.16.156.10011.1.21" extension=""/>
                                        <name></name>
                                        <!-- DE08.10.026.00 科室名称 -->
                                        <asOrganizationPartOf classCode="PART">
                                            <wholeOrganization classCode="ORG" determinerCode="INSTANCE">
                                                <id root="2.16.156.10011.1.26" extension=""/>
                                                <name></name>
                                                <!-- DE08.10.054.00 病区名称 -->
                                                <asOrganizationPartOf classCode="PART">
                                                    <wholeOrganization classCode="ORG" determinerCode="INSTANCE">
                                                        <id root="2.16.156.10011.1.27" extension=""/>
                                                        <name></name>
                                                        <!-- xx医院 -->
                                                        <asOrganizationPartOf classCode="PART">
                                                            <wholeOrganization classCode="ORG"
                                                                               determinerCode="INSTANCE">
                                                                <id root="2.16.156.10011.1.5" extension=""/>
                                                                <name></name>
                                                            </wholeOrganization>
                                                        </asOrganizationPartOf>
                                                    </wholeOrganization>
                                                </asOrganizationPartOf>
                                            </wholeOrganization>
                                        </asOrganizationPartOf>
                                    </wholeOrganization>
                                </asOrganizationPartOf>
                            </wholeOrganization>
                        </asOrganizationPartOf>
                    </serviceProviderOrganization>
                </healthCareFacility>
            </location>
        </encompassingEncounter>
    </componentOf>

    <!-- 既往史章节 -->
    <component>
        <section>
            <code code="11348-0" displayName="HISTORY OF PAST ILLNESS"
                  codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
            <text/>
            <entry>
                <observation classCode="OBS" moodCode="EVN">
                    <code code="DE04.01.108.00" displayName="孕次"
                          codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                    <value xsi:type="INT" value=""/>
                </observation>
            </entry>
            <entry>
                <observation classCode="OBS" moodCode="EVN">
                    <code code="DE02.10.002.00" displayName="产次"
                          codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                    <value xsi:type="INT" value=""/>
                </observation>
            </entry>
        </section>
    </component>

    <!-- 阴道分娩章节 -->
    <component>
        <section>
            <code code="57074-7" displayName="labor and delivery process"
                  codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
            <text/>
            <entry>
                <observation classCode="OBS" moodCode="EVN">
                    <code code="DE05.10.098.00" displayName="预产期"
                          codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                    <value xsi:type="TS" value=""></value>
                </observation>
            </entry>
            <entry>
                <observation classCode="OBS" moodCode="EVN">
                    <code code="DE06.00.224.00" displayName="临产日期时间"
                          codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                    <value xsi:type="TS" value=""></value>
                </observation>
            </entry>
            <entry>
                <observation classCode="OBS" moodCode="EVN">
                    <code code="DE05.10.154.00" displayName="胎膜破裂日期时间"
                          codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                    <value xsi:type="TS" value=""></value>
                </observation>
            </entry>
            <entry>
                <observation classCode="OBS" moodCode="EVN">
                    <code code="DE04.30.058.00" displayName="前羊水性状"
                          codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                    <value xsi:type="ST"></value>
                </observation>
            </entry>
            <entry>
                <observation classCode="OBS" moodCode="EVN">
                    <code code="DE04.30.057.00" displayName="前羊水量(ml)"
                          codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                    <value xsi:type="PQ" value="" unit=""/>
                </observation>
            </entry>
            <entry>
                <observation classCode="OBS" moodCode="EVN">
                    <code code="DE06.00.021.00" displayName="第1产程时长(min)"
                          codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                    <value xsi:type="PQ" value="" unit=""/>
                </observation>
            </entry>
            <entry>
                <observation classCode="OBS" moodCode="EVN">
                    <code code="DE04.10.250.00" displayName="宫口开全日期时间"
                          codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                    <value xsi:type="TS" value=""></value>
                </observation>
            </entry>
            <entry>
                <observation classCode="OBS" moodCode="EVN">
                    <code code="DE06.00.019.00" displayName="第2产程时长(min)"
                          codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                    <value xsi:type="PQ" value="" unit=""/>
                </observation>
            </entry>
            <entry>
                <observation classCode="OBS" moodCode="EVN">
                    <code code="DE02.01.014.00" displayName="胎儿娩出日期时间"
                          codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                    <value xsi:type="TS" value=""></value>
                </observation>
            </entry>
            <entry>
                <observation classCode="OBS" moodCode="EVN">
                    <code code="DE06.00.020.00" displayName="第3产程时长(min)"
                          codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                    <value xsi:type="PQ" value="" unit=""/>
                </observation>
            </entry>
            <entry>
                <observation classCode="OBS" moodCode="EVN">
                    <code code="DE06.00.273.00" displayName="胎盘娩出日期时间"
                          codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                    <value xsi:type="TS" value=""></value>
                </observation>
            </entry>
            <entry>
                <observation classCode="OBS" moodCode="EVN">
                    <code code="DE04.10.236.00" displayName="总产程时长(min)"
                          codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                    <value xsi:type="PQ" value="" unit=""/>
                </observation>
            </entry>
            <entry>
                <observation classCode="OBS" moodCode="EVN">
                    <code code="DE05.01.044.00" displayName="胎方位代码"
                          codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                    <value xsi:type="CD" code="" displayName=""
                           codeSystem="2.16.156.10011.2.3.1.106" codeSystemName="胎方位代码表"/>
                </observation>
            </entry>
            <entry>
                <observation classCode="OBS" moodCode="EVN">
                    <code code="DE06.00.311.00" displayName="胎儿娩出助产标志"
                          codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                    <value xsi:type="BL" value=""/>
                </observation>
            </entry>
            <entry>
                <observation classCode="OBS" moodCode="EVN">
                    <code code="DE06.00.312.00" displayName="助产方式"
                          codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                    <value xsi:type="ST"></value>
                </observation>
            </entry>
            <entry>
                <observation classCode="OBS" moodCode="EVN">
                    <code code="DE05.10.157.00" displayName="胎盘娩出情况"
                          codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                    <value xsi:type="ST"></value>
                </observation>
            </entry>
            <entry>
                <observation classCode="OBS" moodCode="EVN">
                    <code code="DE05.10.156.00" displayName="胎膜完整情况标志"
                          codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                    <value xsi:type="BL" value=""/>
                </observation>
            </entry>
            <entry>
                <observation classCode="OBS" moodCode="EVN">
                    <code code="DE04.30.063.00" displayName="羊水性状"
                          codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                    <value xsi:type="ST"></value>
                </observation>
            </entry>
            <entry>
                <observation classCode="OBS" moodCode="EVN">
                    <code code="DE04.30.061.00" displayName="羊水量(ml)"
                          codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                    <value xsi:type="PQ" value="" unit=""/>
                </observation>
            </entry>
            <entry>
                <observation classCode="OBS" moodCode="EVN">
                    <code code="DE04.30.055.00" displayName="脐带长度(cm)"
                          codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                    <value xsi:type="PQ" value="" unit=""/>
                </observation>
            </entry>
            <entry>
                <observation classCode="OBS" moodCode="EVN">
                    <code code="DE04.30.059.00" displayName="绕颈身(周)"
                          codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                    <value xsi:type="PQ" value="" unit=""/>
                </observation>
            </entry>
            <entry>
                <observation classCode="OBS" moodCode="EVN">
                    <code code="DE05.10.145.00" displayName="脐带异常情况标志"
                          codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                    <value xsi:type="BL" value=""/>
                </observation>
            </entry>
            <entry>
                <observation classCode="OBS" moodCode="EVN">
                    <code code="DE08.50.022.00" displayName="产时用药"
                          codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                    <value xsi:type="ST"></value>
                </observation>
            </entry>
            <entry>
                <observation classCode="OBS" moodCode="EVN">
                    <code code="DE06.00.295.00" displayName="预防措施"
                          codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                    <value xsi:type="ST"></value>
                </observation>
            </entry>
            <entry>
                <observation classCode="OBS" moodCode="EVN">
                    <code code="DE05.10.165.00" displayName="产妇会阴切开标志"
                          codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                    <value xsi:type="BL" value=""/>
                </observation>
            </entry>
            <entry>
                <observation classCode="OBS" moodCode="EVN">
                    <code code="DE04.10.252.00" displayName="会阴切开位置"
                          codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                    <value xsi:type="ST"></value>
                </observation>
            </entry>
            <entry>
                <observation classCode="OBS" moodCode="EVN">
                    <code code="DE06.00.011.00" displayName="产妇会阴缝合针数"
                          codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                    <value xsi:type="INT" value=""/>
                </observation>
            </entry>
            <entry>
                <observation classCode="OBS" moodCode="EVN">
                    <code code="DE05.01.003.00" displayName="产妇会阴裂伤程度代码"
                          codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                    <value xsi:type="CD" code="" displayName=""
                           codeSystem="2.16.156.10011.2.3.1.109" codeSystemName="产妇会阴裂伤程度代码表"/>
                </observation>
            </entry>
            <entry>
                <observation classCode="OBS" moodCode="EVN">
                    <code code="DE04.10.253.00" displayName="会阴血肿标志"
                          codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                    <value xsi:type="BL" value=""/>
                </observation>
            </entry>
            <entry>
                <observation classCode="OBS" moodCode="EVN">
                    <code code="DE04.10.254.00" displayName="阴道血肿大小"
                          codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                    <value xsi:type="ST"></value>
                </observation>
            </entry>
            <entry>
                <observation classCode="OBS" moodCode="EVN">
                    <code code="DE06.00.213.00" displayName="阴道血肿处理"
                          codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                    <value xsi:type="ST"></value>
                </observation>
            </entry>
            <entry>
                <observation classCode="OBS" moodCode="EVN">
                    <code code="DE06.00.073.00" displayName="麻醉方法代码"
                          codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                    <value xsi:type="CD" code="" displayName=""
                           codeSystem="2.16.156.10011.2.3.1.159" codeSystemName="麻醉方法代码表"/>
                </observation>
            </entry>
            <entry>
                <observation classCode="OBS" moodCode="EVN">
                    <code code="DE08.50.022.00" displayName="麻醉药物名称"
                          codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                    <value xsi:type="ST"></value>
                </observation>
            </entry>
            <entry>
                <observation classCode="OBS" moodCode="EVN">
                    <code code="DE05.10.163.00" displayName="阴道裂伤标志"
                          codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                    <value xsi:type="BL" value=""></value>
                </observation>
            </entry>
            <entry>
                <observation classCode="OBS" moodCode="EVN">
                    <code code="DE05.10.164.00" displayName="阴道血肿标志"
                          codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                    <value xsi:type="BL" value=""></value>
                </observation>
            </entry>
            <entry>
                <observation classCode="OBS" moodCode="EVN">
                    <code code="DE04.10.249.00" displayName="宫颈裂伤标志"
                          codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                    <value xsi:type="BL" value=""></value>
                </observation>
            </entry>
            <entry>
                <observation classCode="OBS" moodCode="EVN">
                    <code code="DE06.00.200.00" displayName="宫颈缝合情况"
                          codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                    <value xsi:type="ST"></value>
                </observation>
            </entry>
            <entry>
                <observation classCode="OBS" moodCode="EVN">
                    <code code="DE08.50.022.00" displayName="产后用药"
                          codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                    <value xsi:type="ST"></value>
                </observation>
            </entry>
            <entry>
                <observation classCode="OBS" moodCode="EVN">
                    <code code="DE06.00.182.00" displayName="分娩过程摘要"
                          codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                    <value xsi:type="ST"></value>
                </observation>
            </entry>
            <entry>
                <observation classCode="OBS" moodCode="EVN">
                    <code code="DE04.10.245.00" displayName="宫缩情况"
                          codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                    <value xsi:type="ST"></value>
                </observation>
            </entry>
            <entry>
                <observation classCode="OBS" moodCode="EVN">
                    <code code="DE04.10.233.00" displayName="子宫情况"
                          codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                    <value xsi:type="ST"></value>
                </observation>
            </entry>
            <entry>
                <observation classCode="OBS" moodCode="EVN">
                    <code code="DE05.10.137.00" displayName="会阴情况"
                          codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                    <value xsi:type="ST"></value>
                </observation>
            </entry>
            <entry>
                <observation classCode="OBS" moodCode="EVN">
                    <code code="DE06.00.284.00" displayName="修补手术过程"
                          codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                    <value xsi:type="ST"></value>
                </observation>
            </entry>
            <entry>
                <observation classCode="OBS" moodCode="EVN">
                    <code code="DE04.50.138.00" displayName="存脐带血情况标志"
                          codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                    <value xsi:type="BL" value=""/>
                </observation>
            </entry>
        </section>
    </component>

    <!-- 产后处置章节 -->
    <component>
        <section>
            <code code="57076-2" displayName="postpartum hospitalization treatment"
                  codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
            <text/>
            <entry>
                <observation classCode="OBS" moodCode="EVN">
                    <code code="DE05.10.007.00" displayName="产后诊断"
                          codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                    <value xsi:type="ST"></value>
                </observation>
            </entry>

            <entry>
                <observation classCode="OBS" moodCode="EVN">
                    <code code="DE06.00.218.00" displayName="产后观察日期时间"
                          codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                    <value xsi:type="TS" value=""/>
                </observation>
            </entry>

            <entry>
                <observation classCode="OBS" moodCode="EVN">
                    <code code="DE04.10.246.00" displayName="产后检查时间(min)"
                          codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                    <value xsi:type="PQ" value="" unit=""></value>
                </observation>
            </entry>

            <entry>
                <organizer classCode="BATTERY" moodCode="EVN">
                    <statusCode/>
                    <component>
                        <observation classCode="OBS" moodCode="EVN">
                            <code code="DE04.10.174.00" displayName="收缩压"
                                  codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                            <value xsi:type="PQ" value="" unit=""></value>
                        </observation>
                    </component>
                    <component>
                        <observation classCode="OBS" moodCode="EVN">
                            <code code="DE04.10.176.00" displayName="舒张压"
                                  codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                            <value xsi:type="PQ" value="" unit=""></value>
                        </observation>
                    </component>
                </organizer>
            </entry>
            <entry>
                <observation classCode="OBS" moodCode="EVN">
                    <code code="DE04.10.118.00" displayName="产后脉搏(次/min)"
                          codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                    <value xsi:type="PQ" value="" unit=""></value>
                </observation>
            </entry>
            <entry>
                <observation classCode="OBS" moodCode="EVN">
                    <code code="DE04.10.206.00" displayName="产后心率(次/min)"
                          codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                    <value xsi:type="PQ" value="" unit=""></value>
                </observation>
            </entry>
            <entry>
                <observation classCode="OBS" moodCode="EVN">
                    <code code="DE04.10.012.00" displayName="产后出血量(ml)"
                          codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                    <value xsi:type="PQ" value="" unit=""></value>
                </observation>
            </entry>
            <entry>
                <observation classCode="OBS" moodCode="EVN">
                    <code code="DE04.10.245.00" displayName="产后宫缩"
                          codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                    <value xsi:type="ST"></value>
                </observation>
            </entry>
            <entry>
                <observation classCode="OBS" moodCode="EVN">
                    <code code="DE04.10.067.00" displayName="产后宫底高度(cm)"
                          codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                    <value xsi:type="PQ" value="" unit=""></value>
                </observation>
            </entry>
            <entry>
                <observation classCode="OBS" moodCode="EVN">
                    <code code="DE04.10.240.00" displayName="肛查"
                          codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                    <value xsi:type="ST"></value>
                </observation>
            </entry>
        </section>
    </component>

    <!-- 新生儿章节 -->
    <component>
        <section>
            <code code="57075-4" displayName="newborn delivery information"
                  codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
            <text/>
            <entry>
                <observation classCode="OBS" moodCode="EVN">
                    <code code="DE02.01.040.00" displayName="新生儿性别代码"
                          codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                    <value xsi:type="CD" code="" displayName=""
                           codeSystem="2.16.156.10011.2.3.3.4" codeSystemName="性别代码表"/>
                </observation>
            </entry>

            <entry>
                <observation classCode="OBS" moodCode="EVN">
                    <code code="DE04.10.019.00" displayName="新生儿出生体重(g)"
                          codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                    <value xsi:type="PQ" value="" unit=""></value>
                </observation>
            </entry>

            <entry>
                <observation classCode="OBS" moodCode="EVN">
                    <code code="DE05.01.044.00" displayName="新生儿出生身长(cm)"
                          codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                    <value xsi:type="PQ" value="" unit=""></value>
                </observation>
            </entry>

            <entry>
                <observation classCode="OBS" moodCode="EVN">
                    <code code="DE05.10.168.00" displayName="产瘤大小"
                          codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                    <value xsi:type="ST"></value>
                </observation>
            </entry>

            <entry>
                <observation classCode="OBS" moodCode="EVN">
                    <code code="DE05.10.167.00" displayName="产瘤部位"
                          codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                    <value xsi:type="ST"></value>
                </observation>
            </entry>
        </section>
    </component>

    <!-- 分娩评估章节 -->
    <component>
        <section>
            <code code="51848-0" displayName="Assessment note"
                  codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
            <text/>
            <entry>
                <observation classCode="OBS" moodCode="EVN">
                    <code code="DE06.00.215.00" displayName="Apgar评分间隔时间代码"
                          codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                    <value xsi:type="CD" code="" displayName=""
                           codeSystem="2.16.156.10011.2.3.2.48" codeSystemName="Apgar评分间隔时间代码表"/>
                </observation>
            </entry>

            <entry>
                <observation classCode="OBS" moodCode="EVN">
                    <code code="DE05.10.001.00" displayName="Apgar评分值"
                          codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                    <value xsi:type="INT" value=""/>
                </observation>
            </entry>

            <entry>
                <observation classCode="OBS" moodCode="EVN">
                    <code code="DE06.00.026.00" displayName="分娩结局代码"
                          codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                    <value xsi:type="CD" code="" displayName=""
                           codeSystem="2.16.156.10011.2.3.2.49" codeSystemName="分娩结局代码表"/>
                </observation>
            </entry>

            <entry>
                <observation classCode="OBS" moodCode="EVN">
                    <code code="DE05.10.160.00" displayName="新生儿异常情况代码"
                          codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                    <value xsi:type="CD" code="" displayName=""
                           codeSystem="2.16.156.10011.2.3.1.254" codeSystemName="新生儿异常情况代码表"/>
                </observation>
            </entry>
        </section>
    </component>
</ClinicalDocument>
