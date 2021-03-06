<?xml version="1.0" encoding="UTF-8"?>
<ClinicalDocument xmlns="urn:hl7-org:v3" xmlns:mif="urn:hl7-org:v3/mif"
                  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                  xsi:schemaLocation="urn:hl7-org:v3 ..\sdschemas\SDA.xsd">
    <realmCode code="CN"/>
    <typeId root="2.16.840.1.113883.1.3" extension="POCD_MT000040"/>
    <templateId root="2.16.156.10011.2.1.1.31"/>
    <!-- 文档流水号 -->
    <id root="2.16.156.10011.1.1" extension="${docInfo.docId!'文档流水号标识'}"/>
    <code code="C0011" codeSystem="2.16.156.10011.2.4" codeSystemName="卫生信息共享文档规范编码体系"/>
    <title>麻醉记录</title>
    <!-- 文档机器生成时间 -->
    <effectiveTime value="${docInfo.effectiveTime!'文档机器生成时间'}"/>
    <confidentialityCode code="N" codeSystem="2.16.840.1.113883.5.25" codeSystemName="Confidentiality"
                         displayName="正常访问保密级别"/>
    <languageCode code="zh-CN"/>
    <setId/>
    <versionNumber/>
    <recordTarget typeCode="RCT" contextControlCode="OP">
        <patientRole classCode="PAT">
            <!-- 门诊号标识 -->
            <id root="2.16.156.10011.1.11" extension="${anesthesiaRecord.门急诊号!'门急诊号'}"/>
            <!-- 住院号标识 -->
            <id root="2.16.156.10011.1.12" extension="${anesthesiaRecord.住院号!'住院号'}"/>
            <!-- 电子申请单编号 -->
            <id root="2.16.156.10011.1.24" extension="${anesthesiaRecord.电子申请单编号!'电子申请单编号'}"/>

            <patient classCode="PSN" determinerCode="INSTANCE">
                <!-- 患者身份证号标识 -->
                <id root="2.16.156.10011.1.3" extension="${patient.患者身份证件号码!'患者身份证件号码'}"/>
                <!-- 患者姓名 -->
                <name>${patient.患者姓名!'患者姓名'}</name>
                <!-- 性别代码 -->
                <administrativeGenderCode code="${patient.性别代码!'性别代码'}" codeSystem="2.16.156.10011.2.3.3.4"
                                          codeSystemName="生理性别代码表(GB/T 2261.1)" displayName="${patient.性别!'性别'}"/>
                <birthTime value="${patient.出生日期!'出生日期'}"/>
                <age unit="岁" value="${anesthesiaRecord.年龄岁!'年龄岁'}"/>
            </patient>
        </patientRole>
    </recordTarget>
    <!-- 文档创作者 -->
    <author typeCode="AUT" contextControlCode="OP">
        <time value="${patient.建档日期时间!'建档日期时间'}"/>
        <assignedAuthor classCode="ASSIGNED">
            <id root="2.16.156.10011.1.7" extension="${patient.建档者序号!'建档者唯一标识符'}"/>
            <!-- 医师姓名 -->
            <assignedPerson>
                <name>${patient.建档者姓名!'建档者姓名'}</name>
            </assignedPerson>
        </assignedAuthor>
    </author>
    <!-- 保管机构 -->
    <custodian typeCode="CST">
        <assignedCustodian classCode="ASSIGNED">
            <representedCustodianOrganization classCode="ORG" determinerCode="INSTANCE">
                <id root="2.16.156.10011.1.5" extension="${patient.建档医疗机构组织机构!'建档医疗机构组织机构'}"/>
                <name>${orgName!'建档医疗机构组织机构名称'}</name>
            </representedCustodianOrganization>
        </assignedCustodian>
    </custodian>

    <!-- 麻醉医师签名 -->
    <authenticator>
        <!-- 签名日期时间 -->
        <time/>
        <signatureCode/>
        <assignedEntity>
            <id root="2.16.156.10011.1.4" extension=""/>
            <code displayName="麻醉医师"/>
            <assignedPerson classCode="PSN" determinerCode="INSTANCE">
                <name>${anesthesiaRecord.麻醉医师签名!'麻醉医师签名'}</name>
            </assignedPerson>
        </assignedEntity>
    </authenticator>

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
                                <id root="2.16.156.10011.1.22" extension="${anesthesiaRecord.病床号!'病床号'}"/>
                                <name></name>
                                <!-- DE01.00.019.00 病房号 -->
                                <asOrganizationPartOf classCode="PART">
                                    <wholeOrganization classCode="ORG" determinerCode="INSTANCE">
                                        <id root="2.16.156.10011.1.21" extension="${anesthesiaRecord.病房号!'病房号'}"/>
                                        <name></name>
                                        <!-- DE08.10.026.00 科室名称 -->
                                        <asOrganizationPartOf classCode="PART">
                                            <wholeOrganization classCode="ORG" determinerCode="INSTANCE">
                                                <id root="2.16.156.10011.1.26" extension=""/>
                                                <name>${anesthesiaRecord.科室名称!'科室名称'}</name>
                                                <!-- DE08.10.054.00 病区名称 -->
                                                <asOrganizationPartOf classCode="PART">
                                                    <wholeOrganization classCode="ORG" determinerCode="INSTANCE">
                                                        <id root="2.16.156.10011.1.27" extension=""/>
                                                        <name>${anesthesiaRecord.病区名称!'病区名称'}</name>
                                                        <!-- xx医院 -->
                                                        <asOrganizationPartOf classCode="PART">
                                                            <wholeOrganization classCode="ORG"
                                                                               determinerCode="INSTANCE">
                                                                <id root="2.16.156.10011.1.5" extension=""/>
                                                                <name>${orgName!'建档医疗机构组织机构名称'}</name>
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

    <!-- 实验室检验章节 -->
    <component>
        <section>
            <code code="30954-2" displayName="STUDIES SUMMARY"
                  codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
            <text/>
            <!-- 血型 -->
            <entry typeCode="COMP">
                <organizer classCode="BATTERY" moodCode="EVN">
                    <statusCode/>
                    <!-- ABO血型 -->
                    <component typeCode="COMP">
                        <observation classCode="OBS" moodCode="EVN">
                            <code code="DE04.50.001.00" displayName="ABO血型代码"
                                  codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                            <value xsi:type="CD" code="${anesthesiaRecord.ABO血型代码!'ABO血型代码'}" displayName="${anesthesiaRecord.ABO血型名称!'ABO血型名称'}"
                                   codeSystem="2.16.156.10011.2.3.1.85" codeSystemName="ABO血型代码表"/>
                        </observation>
                    </component>
                    <!-- Rh血型 -->
                    <component>
                        <observation classCode="OBS" moodCode="EVN">
                            <code code="DE04.50.010.00" displayName="Rh(D)血型代码"
                                  codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                            <value xsi:type="CD" code="${anesthesiaRecord.RH血型代码!'RH血型代码'}" displayName="${anesthesiaRecord.RH血型名称!'RH血型名称'}"
                                   codeSystem="2.16.156.10011.2.3.1.250" codeSystemName="Rh(D)血型代码表"/>
                        </observation>
                    </component>
                </organizer>
            </entry>
        </section>
    </component>

    <!-- 术前诊断章节 -->
    <component>
        <section>
            <code code="10219-4" displayName="Surgical operation note preoperative Dx"
                  codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
            <text/>
            <!-- 术前诊断 -->
            <entry>
                <observation classCode="OBS" moodCode="EVN">
                    <code code="DE05.01.024.00" displayName="术前诊断编码"
                          codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                    <value xsi:type="CD" code="${anesthesiaRecord.术前诊断编码!'术前诊断编码'}" displayName="${anesthesiaRecord.术前诊断名称!'术前诊断名称'}"
                           codeSystem="2.16.156.10011.2.3.3.11.3" codeSystemName="诊断代码表(ICD-10)"/>
                </observation>
            </entry>
        </section>
    </component>

    <!-- 术后诊断章节 -->
    <component>
        <section>
            <code code="10218-6" displayName="Surgical operation note postoperative Dx"
                  codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
            <text/>
            <!-- 术后诊断 -->
            <entry>
                <observation classCode="OBS" moodCode="EVN">
                    <code code="DE05.01.024.00" displayName="术后诊断编码"
                          codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                    <value xsi:type="CD" code="${anesthesiaRecord.术后诊断编码!'术后诊断编码'}" displayName="${anesthesiaRecord.术后诊断名称!'术后诊断名称'}"
                           codeSystem="2.16.156.10011.2.3.3.11.3" codeSystemName="诊断代码表(ICD-10)"/>
                </observation>
            </entry>
        </section>
    </component>


    <!--<component>
        <section>
            <code code="18610-6" displayName="MEDICATION ADMINISTERED"
                  codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
            <text/>
            过敏史条目
            <entry>
                <observation classCode="OBS" moodCode="EVN">
                    <code code="DE02.10.022.00" displayName="过敏史"
                          codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                    <value xsi:type="ST"></value>
                </observation>
            </entry>
        </section>
    </component>-->

    <!-- 体格检查章节 -->


    <!-- 用药管理章节 -->
    <component>
        <section>
            <code code="18610-6" displayName="MEDICATION ADMINISTERED"
                  codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
            <text/>
            <entry>
                <substanceAdministration classCode="SBADM" moodCode="EVN">
                    <text/>
                    <!-- 药物使用途径代码 -->
                    <routeCode code="${anesthesiaRecord.用药途径代码!'用药途径代码'}" displayName="${anesthesiaRecord.用药途径!'用药途径'}"
                          codeSystem="2.16.156.10011.2.3.1.158" codeSystemName="用药途径代码表"/>
                    <!-- 药物使用次剂量 -->
                    <doseQuantity value="${anesthesiaRecord.药物使用次剂量!'药物使用次剂量'}" unit=""/>
                    <consumable>
                        <manufacturedProduct>
                            <manufactredLabeledDrug>
                                <!-- 药品代码及名称(通用名) -->
                                <code/>
                                <name>${anesthesiaRecord.药物名称!'药物名称'}</name>
                            </manufactredLabeledDrug>
                        </manufacturedProduct>
                    </consumable>
                    <!-- 药物用法 -->
                    <entryRelationship typeCode="COMP">
                        <observation classCode="OBS" moodCode="EVN">
                            <code code="DE06.00.136.00" displayName="药物用法"
                                  codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                            <value xsi:type="ST">${anesthesiaRecord.药物用法!'药物用法'}</value>
                        </observation>
                    </entryRelationship>
                    <!-- 药物使用频率 -->
                    <entryRelationship typeCode="COMP">
                        <observation classCode="OBS" moodCode="EVN">
                            <code code="DE06.00.133.00" displayName="药物使用频率"
                                  codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                            <value xsi:type="CD" code="${anesthesiaRecord.药物使用频次代码!'药物使用频次代码'}" displayName="${anesthesiaRecord.药物使用频次!'药物使用频次'}"
                                   codeSystem="2.16.156.10011.2.3.1.267" codeSystemName="药物使用频次代码表"/>
                        </observation>
                    </entryRelationship>
                    <!-- 药物使用剂量单位 -->
                    <entryRelationship typeCode="COMP">
                        <observation classCode="OBS" moodCode="EVN">
                            <code code="DE08.50.024.00" displayName="药物使用剂量单位"
                                  codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                            <value xsi:type="ST">${anesthesiaRecord.药物使用剂量单位!'药物使用剂量单位'}</value>
                        </observation>
                    </entryRelationship>
                    <!-- 药物使用总剂量 -->
                    <entryRelationship typeCode="COMP">
                        <observation classCode="OBS" moodCode="EVN">
                            <code code="DE06.00.135.00" displayName="药物使用总剂量"
                                  codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                            <value xsi:type="PQ" value="${anesthesiaRecord.药物使用总剂量!'药物使用总剂量'}" unit=""></value>
                        </observation>
                    </entryRelationship>
                </substanceAdministration>
            </entry>
        </section>
    </component>

    <!-- 输液章节 -->
    <component>
        <section>
            <code code="10216-0" displayName="Surgical operation note fluids"
                  codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
            <text/>
            <!-- 术中输液项目 -->
            <entry>
                <observation classCode="OBS" moodCode="EVN">
                    <code code="DE06.00.269.00" displayName="术中输液项目"
                          codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                    <value xsi:type="ST">${anesthesiaRecord.术中输液项目!'术中输液项目'}</value>
                </observation>
            </entry>
        </section>
    </component>

    <!-- 输血章节 -->
    <component>
        <section>
            <code code="56836-0" displayName="History of blood transfusion"
                  codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
            <text/>
            <entry>
                <procedure classCode="PROC" moodCode="EVN">
                    <!-- 输血日期时间 -->
                    <effectiveTime>
                        <high value="${anesthesiaRecord.麻醉医师签名!'麻醉医师签名'}"/>
                    </effectiveTime>
                    <!-- 输血品种代码 -->
                    <entryRelationship typeCode="COMP">
                        <observation classCode="OBS" moodCode="EVN">
                            <code code="DE08.50.040.00" displayName="输血品种代码"
                                  codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                            <value xsi:type="CD" code="${anesthesiaRecord.输血品种代码!'输血品种代码'}" displayName="${anesthesiaRecord.输血品种!'输血品种'}"
                                   codeSystem="2.16.156.10011.2.3.1.251" codeSystemName="输血品种代码表"/>
                        </observation>
                    </entryRelationship>
                    <!-- 输血量(ml) -->
                    <entryRelationship typeCode="COMP">
                        <observation classCode="OBS" moodCode="EVN">
                            <code code="DE06.00.267.00" displayName="输血量(ml)"
                                  codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                            <value xsi:type="PQ" value="${anesthesiaRecord.输血量!'输血量'}" unit=""/>
                        </observation>
                    </entryRelationship>
                    <!-- 输血量计量单位 -->
                    <entryRelationship typeCode="COMP">
                        <observation classCode="OBS" moodCode="EVN">
                            <code code="DE08.50.036.00" displayName="输血量计量单位"
                                  codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                            <value xsi:type="ST">${anesthesiaRecord.输血量计量单位!'输血量计量单位'}</value>
                        </observation>
                    </entryRelationship>
                    <!-- 输血反应标志 -->
                    <entryRelationship typeCode="COMP">
                        <observation classCode="OBS" moodCode="EVN">
                            <code code="DE06.00.264.00" displayName="输血反应标志"
                                  codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                            <value xsi:type="BL" value="${anesthesiaRecord.输血反应标志!'输血反应标志'}"></value>
                        </observation>
                    </entryRelationship>
                </procedure>
            </entry>
        </section>
    </component>

    <!-- 麻醉章节 -->
    <component>
        <section>
            <code code="59774-0" displayName="Procedure anesthesia"
                  codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
            <text/>
            <entry>
                <!-- 麻醉记录 -->
                <procedure classCode="PROC" moodCode="EVN">
                    <!-- 麻醉方法代码 -->
                    <code code="${anesthesiaRecord.麻醉方法代码!'麻醉方法代码'}" displayName="${anesthesiaRecord.麻醉方法!'麻醉方法'}"
                          codeSystem="2.16.156.10011.2.3.1.159" codeSystemName="麻醉方法代码表"/>
                    <effectiveTime>
                        <!-- 麻醉开始日期时间 -->
                        <low value="${anesthesiaRecord.麻醉开始日期时间!'麻醉开始日期时间'}"/>
                    </effectiveTime>
                    <!-- ASA分级标准代码 -->
                    <entryRelationship typeCode="COMP">
                        <observation classCode="OBS" moodCode="EVN">
                            <code code="DE05.10.129.00" displayName="ASA分级标准代码"
                                  codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                            <value xsi:type="CD" code="${anesthesiaRecord.ASA分级标准代码!'ASA分级标准代码'}" displayName="${anesthesiaRecord.ASA分级标准!'ASA分级标准'}"
                                   codeSystem="2.16.156.10011.2.3.1.255" codeSystemName="美国麻醉医师协会(ASA)分级标准代码表"/>
                        </observation>
                    </entryRelationship>
                    <!-- 气管插管分类 -->
                    <entryRelationship typeCode="COMP">
                        <observation classCode="OBS" moodCode="EVN">
                            <code code="DE06.00.228.00" displayName="气管插管分类"
                                  codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                            <value xsi:type="ST">${anesthesiaRecord.气管插管分类!'气管插管分类'}</value>
                        </observation>
                    </entryRelationship>
                    <!-- 麻醉药物名称 -->
                    <entryRelationship typeCode="COMP">
                        <observation classCode="OBS" moodCode="EVN">
                            <code code="DE08.50.022.00" displayName="麻醉药物名称"
                                  codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                            <value xsi:type="ST">${anesthesiaRecord.麻醉药物名称!'麻醉药物名称'}</value>
                        </observation>
                    </entryRelationship>
                    <!-- 麻醉体位 -->
                    <entryRelationship typeCode="COMP">
                        <observation classCode="OBS" moodCode="EVN">
                            <code code="DE04.10.260.00" displayName="麻醉体位"
                                  codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                            <value xsi:type="ST">${anesthesiaRecord.麻醉体位!'麻醉体位'}</value>
                        </observation>
                    </entryRelationship>
                    <!-- 呼吸类型代码 -->
                    <entryRelationship typeCode="COMP">
                        <observation classCode="OBS" moodCode="EVN">
                            <code code="DE06.00.208.00" displayName="呼吸类型代码"
                                  codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                            <value xsi:type="CD" code="${anesthesiaRecord.呼吸类型代码!'呼吸类型代码'}" displayName="${anesthesiaRecord.呼吸类型!'呼吸类型'}"
                                   codeSystem="2.16.156.10011.2.3.2.1" codeSystemName="呼吸类型代码表"/>
                        </observation>
                    </entryRelationship>
                    <!-- 麻醉描述 -->
                    <entryRelationship typeCode="COMP">
                        <observation classCode="OBS" moodCode="EVN">
                            <code code="DE06.00.226.00" displayName="麻醉描述"
                                  codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                            <value xsi:type="ST">${anesthesiaRecord.麻醉描述!'麻醉描述'}</value>
                        </observation>
                    </entryRelationship>
                    <!-- 麻醉合并症标志代码 -->
                    <entryRelationship typeCode="COMP">
                        <observation classCode="OBS" moodCode="EVN">
                            <code code="DE05.01.077.00" displayName="麻醉合并症标志代码"
                                  codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                            <value xsi:type="CD" code="${anesthesiaRecord.麻醉合并症标志代码!'麻醉合并症标志代码'}" displayName="${anesthesiaRecord.麻醉合并症标志!'麻醉合并症标志'}"
                                   codeSystem="2.16.156.10011.2.3.2.59" codeSystemName="麻醉合并症标志代码表"/>
                        </observation>
                    </entryRelationship>
                    <!-- 穿刺过程 -->
                    <entryRelationship typeCode="COMP">
                        <observation classCode="OBS" moodCode="EVN">
                            <code code="DE05.10.063.00" displayName="穿刺过程"
                                  codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                            <value xsi:type="ST">${anesthesiaRecord.穿刺过程!'穿刺过程'}</value>
                        </observation>
                    </entryRelationship>
                    <!-- 麻醉效果 -->
                    <entryRelationship typeCode="COMP">
                        <observation classCode="OBS" moodCode="EVN">
                            <code code="DE06.00.253.00" displayName="麻醉效果"
                                  codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                            <value xsi:type="ST">${anesthesiaRecord.麻醉效果!'麻醉效果'}</value>
                        </observation>
                    </entryRelationship>
                    <!-- 麻醉前用药 -->
                    <entryRelationship typeCode="COMP">
                        <observation classCode="OBS" moodCode="EVN">
                            <code code="DE06.00.136.00" displayName="麻醉前用药"
                                  codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                            <value xsi:type="ST">${anesthesiaRecord.麻醉前用药!'麻醉前用药'}</value>
                        </observation>
                    </entryRelationship>
                </procedure>
            </entry>
        </section>
    </component>

    <!-- 主要健康问题章节 -->
    <component>
        <section>
            <code code="11450-4" displayName="PROBLEM LIST"
                  codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
            <text/>
            <!-- 常规监测项目名称 -->
            <entry>
                <observation classCode="OBS" moodCode="EVN">
                    <code code="DE06.00.216.00" displayName="常规监测项目名称"
                          codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                    <value xsi:type="ST">${anesthesiaRecord.常规监测项目名称!'常规监测项目名称'}</value>
                    <!-- 常规监测项目结果 -->
                    <entryRelationship typeCode="COMP">
                        <observation classCode="OBS" moodCode="EVN">
                            <code code="DE06.00.281.00" displayName="常规监测项目结果"
                                  codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                            <value xsi:type="ST">${anesthesiaRecord.常规监测项目结果!'常规监测项目结果'}</value>
                        </observation>
                    </entryRelationship>
                </observation>
            </entry>

            <!-- 特殊监测项目名称 -->
            <entry>
                <observation classCode="OBS" moodCode="EVN">
                    <code code="DE06.00.216.00" displayName="特殊监测项目名称"
                          codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                    <value xsi:type="ST">${anesthesiaRecord.特殊监测项目名称!'特殊监测项目名称'}</value>
                    <!-- 特殊监测项目结果 -->
                    <entryRelationship typeCode="COMP">
                        <observation classCode="OBS" moodCode="EVN">
                            <code code="DE06.00.281.00" displayName="特殊监测项目结果"
                                  codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                            <value xsi:type="ST">${anesthesiaRecord.特殊监测项目结果!'特殊监测项目结果'}</value>
                        </observation>
                    </entryRelationship>
                </observation>
            </entry>
        </section>
    </component>

    <!-- 生命体征章节 -->
    <component>
        <section>
            <code code="8716-3" displayName="VITAL SIGNS"
                  codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
            <text/>
            <!-- 体重 -->
            <entry>
                <observation classCode="OBS" moodCode="EVN">
                    <code code="DE04.10.188.00" displayName="体重"
                          codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                    <value xsi:type="PQ" unit="kg" value="${anesthesiaRecord.体重!'体重'}"></value>
                </observation>
            </entry>

            <entry>
                <observation classCode="OBS" moodCode="EVN">
                    <code code="DE04.10.186.00" displayName="体温"
                          codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                    <value xsi:type="PQ" unit="" value="${anesthesiaRecord.体温!'体温'}"></value>
                </observation>
            </entry>

            <entry>
                <observation classCode="OBS" moodCode="EVN">
                    <code code="DE04.10.118.00" displayName="脉率"
                          codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                    <value xsi:type="PQ" unit="" value="${anesthesiaRecord.脉率!'脉率'}"></value>
                </observation>
            </entry>

            <entry>
                <observation classCode="OBS" moodCode="EVN">
                    <code code="DE04.10.081.00" displayName="呼吸频率"
                          codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                    <value xsi:type="PQ" unit="" value="${anesthesiaRecord.呼吸频率!'呼吸频率'}"></value>
                </observation>
            </entry>

            <entry>
                <observation classCode="OBS" moodCode="EVN">
                    <code code="DE04.10.206.00" displayName="心率"
                          codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                    <value xsi:type="PQ" unit="" value="${anesthesiaRecord.心率!'心率'}"></value>
                </observation>
            </entry>

            <!-- 体格检查-血压(mmHg) -->
            <entry>
                <organizer classCode="BATTERY" moodCode="EVN">
                    <code displayName="血压"/>
                    <statusCode/>
                    <component>
                        <observation classCode="OBS" moodCode="EVN">
                            <code code="DE04.10.174.00" displayName="收缩压"
                                  codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                            <value xsi:type="PQ" unit="" value="${anesthesiaRecord.收缩压!'收缩压'}"></value>
                        </observation>
                    </component>
                    <component>
                        <observation classCode="OBS" moodCode="EVN">
                            <code code="DE04.10.176.00" displayName="舒张压"
                                  codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                            <value xsi:type="PQ" unit="" value="${anesthesiaRecord.舒张压!'舒张压'}"></value>
                        </observation>
                    </component>
                </organizer>
            </entry>
        </section>
    </component>

    <!-- 手术操作章节 -->
    <component>
        <section>
            <code code="47519-4" displayName="HISTORY OF PROCEDURES"
                  codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
            <text/>
            <!-- 手术记录 -->
            <entry>
                <procedure classCode="PROC" moodCode="EVN">
                    <code code="${anesthesiaRecord.手术及操作编码!'手术及操作编码'}" displayName="${anesthesiaRecord.手术及操作名称!'手术及操作名称'}"
                          codeSystem="2.16.156.10011.2.3.3.12" codeSystemName="手术(操作)代码表(ICD-9-CM)"/>
                    <!-- 操作日期/时间 -->
                    <effectiveTime>
                        <!-- 手术开始日期时间 -->
                        <low value="${anesthesiaRecord.手术开始日期时间!'手术开始日期时间'}"/>
                        <!-- 手术结束日期时间 -->
                        <high value="${anesthesiaRecord.手术结束日期时间!'手术结束日期时间'}"/>
                    </effectiveTime>
                    <!-- 手术者姓名 -->
                    <performer>
                        <assignedEntity>
                            <id root="2.16.156.10011.1.4" extension=""/>
                            <assignedPerson>
                                <name>${anesthesiaRecord.手术者姓名!'手术者姓名'}</name>
                            </assignedPerson>
                        </assignedEntity>
                    </performer>
                    <!-- 手术间编号 -->
                    <entryRelationship typeCode="COMP">
                        <observation classCode="OBS" moodCode="EVN">
                            <code code="DE06.00.256.00" displayName="患者实施手术所在的手术室编号"
                                  codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                            <value xsi:type="ST">${anesthesiaRecord.手术间编号!'手术间编号'}</value>
                        </observation>
                    </entryRelationship>
                    <!-- 手术体位代码 -->
                    <entryRelationship typeCode="COMP">
                        <observation classCode="OBS" moodCode="EVN">
                            <code code="DE06.00.260.00" displayName="手术体位代码"
                                  codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                            <value xsi:type="CD" code="${anesthesiaRecord.手术体位代码!'手术体位代码'}" displayName="${anesthesiaRecord.手术体位!'手术体位'}"
                                   codeSystem="2.16.156.10011.2.3.1.262" codeSystemName="手术体位代码表"/>
                        </observation>
                    </entryRelationship>
                    <!-- 诊疗过程描述 -->
                    <entryRelationship typeCode="COMP">
                        <observation classCode="OBS" moodCode="EVN">
                            <code code="DE06.00.296.00" displayName="诊疗过程描述"
                                  codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                            <value xsi:type="ST">${anesthesiaRecord.诊疗过程描述!'诊疗过程描述'}</value>
                        </observation>
                    </entryRelationship>
                </procedure>
            </entry>
        </section>
    </component>

    <!-- 失血章节 -->
    <component>
        <section>
            <code code="55103-6" displayName="Surgical operation note estimated blood loss"
                  codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
            <text/>
            <!-- 出血量(ml) -->
            <entry>
                <observation classCode="OBS" moodCode="EVN">
                    <code code="DE06.00.097.00" displayName="出血量(ml)"
                          codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                    <value xsi:type="PQ" unit="ml" value="${anesthesiaRecord.出血量!'出血量'}"></value>
                </observation>
            </entry>
        </section>
    </component>

    <!-- 术后去向章节 -->
    <component>
        <section>
            <code code="59775-7" displayName="Procedure disposition"
                  codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
            <text/>
            <!-- 患者去向代码 -->
            <entry>
                <observation classCode="OBS" moodCode="EVN">
                    <code code="DE06.00.185.00" displayName="患者去向代码"
                          codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                    <effectiveTime>
                        <!-- 出手术室日期时间 -->
                        <high value="${anesthesiaRecord.出手术室日期时间!'出手术室日期时间'}"/>
                    </effectiveTime>
                    <value xsi:type="ST">${anesthesiaRecord.患者去向!'患者去向'}</value>
                </observation>
            </entry>
        </section>
    </component>
</ClinicalDocument>