<?xml version="1.0" encoding="UTF-8"?>
<ClinicalDocument xmlns="urn:hl7-org:v3" xmlns:mif="urn:hl7-org:v3/mif"
                  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                  xsi:schemaLocation="urn:hl7-org:v3 ..\sdschemas\SDA.xsd">
    <realmCode code="CN"/>
    <typeId root="2.16.840.1.113883.1.3" extension="POCD_MT000040"/>
    <templateId root="2.16.156.10011.2.1.1.22"/>
    <id root="2.16.156.10011.1.1" extension=""/>
    <code code="C0002" codeSystem="2.16.156.10011.2.4" codeSystemName="卫生信息共享文档规范编码体系"/>
    <title>门(急)诊病历</title>
    <effectiveTime value=""/>
    <confidentialityCode code="N" codeSystem="2.16.840.1.113883.5.25" codeSystemName="Confidentiality"
                         displayName="正常访问保密级别"/>
    <languageCode code="zh-CN"/>
    <setId/>
    <versionNumber/>
    <recordTarget typeCode="RCT" contextControlCode="OP">
        <patientRole classCode="PAT">
            <!-- 门(急)诊号标识 -->
            <id root="2.16.156.10011.1.11" extension=""/>
            <!-- 电子申请单编号 -->
            <id root="2.16.156.10011.1.24" extension=""/>

            <patient classCode="PSN" determinerCode="INSTANCE">
                <!-- 患者身份证号标识 -->
                <id root="2.16.156.10011.1.3" extension="${patient.patientId!}"/>
                <!-- 患者姓名 -->
                <name>${patient.patientName!}</name>
                <!-- 性别代码 -->
                <administrativeGenderCode code="${patient.genderCode!}" codeSystem="2.16.156.10011.2.3.3.4"
                                          codeSystemName="生理性别代码表(GB/T 2261.1)"/>
                <birthTime value="${patient.birthTime!}"/>
                <age unit="岁" value=""/>
            </patient>
            <providerOrganization>
                <id root="2.16.156.10011.1.26"/>
                <name></name>
                <asOrganizationPartOf>
                    <wholeOrganization>
                        <!-- 机构代码 -->
                        <id root="2.16.156.10011.1.5" extension=""/>
                        <name></name>
                    </wholeOrganization>
                </asOrganizationPartOf>
            </providerOrganization>
        </patientRole>
    </recordTarget>
    <!-- 创建者 -->
    <author typeCode="AUT" contextControlCode="OP">
        <!-- 就诊日期时间 -->
        <time value=""/>
        <assignedAuthor classCode="ASSIGNED">
            <id root="2.16.156.10011.1.7" extension=""/>
            <!-- 就诊医师 -->
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
    <!-- 医师签名 -->
    <legalAuthenticator>
        <time/>
        <signatureCode/>
        <assignedEntity>
            <id root="2.16.156.10011.1.4" extension=""/>
            <code displayName="责任医生"/>
            <assignedPerson>
                <name>${patient.archiverName!}</name>
            </assignedPerson>
        </assignedEntity>
    </legalAuthenticator>

    <relatedDocument typeCode="RPLC">
        <parentDocument>
            <id/>
            <setId/>
            <versionNumber/>
        </parentDocument>
    </relatedDocument>


    <!-- 过敏史章节 -->
    <component>
        <section>
            <code code="48765-2" displayName="Allergies, adverse reactions, alerts"
                  codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
            <text/>
            <!-- 过敏史 -->
            <entry>
                <observation classCode="OBS" moodCode="EVN">
                    <code code="DE02.10.023.00" displayName="过敏史标志"
                          codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                    <value xsi:type="BL" value=""></value>
                    <entryRelationship typeCode="COMP">
                        <observation classCode="OBS" moodCode="EVN">
                            <code code="DE05.01.022.00" displayName="过敏史"
                                  codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                            <value xsi:type="ST">过敏情况详细描述</value>
                        </observation>
                    </entryRelationship>
                </observation>
            </entry>
        </section>
    </component>

    <!-- 主诉章节 -->
    <component>
        <section>
            <code code="10154-3" displayName="CHIEF COMPLAINT"
                  codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
            <text/>
            <!-- 主诉条目 -->
            <entry>
                <observation classCode="OBS" moodCode="EVN">
                    <code code="DE04.01.119.00" displayName="主诉"
                          codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                    <value xsi:type="ST">对患者本次疾病相关的主要症状及其持续时间的描述,一般由患者本人或监护人描述</value>
                </observation>
            </entry>
        </section>
    </component>

    <!-- 现病史章节 -->
    <component>
        <section>
            <code code="10164-2" displayName="HISTORY OF PRESENT ILLNESS"
                  codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
            <text/>
            <!-- 现病史条目 -->
            <entry>
                <observation classCode="OBS" moodCode="EVN">
                    <code code="DE02.10.071.00" displayName="现病史"
                          codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                    <value xsi:type="ST">对患者当前所患疾病情况的详细描述</value>
                </observation>
            </entry>
        </section>
    </component>

    <!-- 既往史章节 -->
    <component>
        <section>
            <code code="11348-0" displayName="HISTORY OF PAST ILLNESS"
                  codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
            <text/>
            <entry>
                <observation classCode="OBS" moodCode="EVN">
                    <code code="DE02.10.099.00" displayName="既往史"
                          codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                    <value xsi:type="ST">对患者既往健康状况和疾病的详细描述</value>
                </observation>
            </entry>
        </section>
    </component>

    <!-- 体格检查章节 -->
    <component>
        <section>
            <code code="29545-1" displayName="PHYSICAL EXAMINATION"
                  codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
            <text/>
            <!-- 体格检查-一般状况检查结果 -->
            <entry>
                <observation classCode="OBS" moodCode="EVN">
                    <code code="DE04.10.258.00" displayName="体格检查"
                          codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                    <value xsi:type="ST">体格检查结果等</value>
                </observation>
            </entry>
        </section>
    </component>

    <!-- 实验室检验章节 -->
    <component>
        <section>
            <code code="30954-2" displayName="STUDIES SUMMARY"
                  codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
            <text/>
            <entry>
                <organizer classCode="CLUSTER" moodCode="EVN">
                    <statusCode/>
                    <component>
                        <observation classCode="OBS" moodCode="EVN">
                            <code code="DE04.30.010.00" displayName="辅助检查项目"
                                  codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                            <value xsi:type="ST">辅助检查项目描述</value>
                        </observation>
                    </component>
                    <component>
                        <observation classCode="OBS" moodCode="EVN">
                            <code code="DE04.30.009.00" displayName="辅助检查结果"
                                  codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                            <value xsi:type="ST">辅助检查结果描述</value>
                        </observation>
                    </component>
                </organizer>
            </entry>
        </section>
    </component>

    <!-- 诊断记录章节 -->
    <component>
        <section>
            <code code="29548-5" displayName="Diagnosis"
                  codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
            <text/>
            <!-- 初诊标志代码 -->
            <entry>
                <observation classCode="OBS" moodCode="EVN">
                    <code code="DE06.00.196.00" displayName="初诊标志代码"
                          codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                    <value xsi:type="CD" code="1" displayName="初诊"
                           codeSystem="2.16.156.10011.2.3.1.85" codeSystemName="初诊标志代码表"/>
                </observation>
            </entry>
            <!-- 中医"四诊"观察结果 -->
            <entry>
                <observation classCode="OBS" moodCode="EVN">
                    <code code="DE02.10.028.00" displayName="中医“四诊”观察结果"
                          codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                    <value xsi:type="ST">观察结果描述</value>
                </observation>
            </entry>

            <!-- 条目:诊断 -->
            <entry>
                <organizer classCode="CLUSTER" moodCode="EVN">
                    <statusCode/>
                    <component>
                        <observation classCode="OBS" moodCode="EVN">
                            <code code="DE05.01.025.00" displayName="诊断名称"
                                  codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                            <value xsi:type="ST"></value>
                        </observation>
                    </component>

                    <component>
                        <observation classCode="OBS" moodCode="EVN">
                            <code code="DE05.01.024.00" displayName="诊断代码"
                                  codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                            <value xsi:type="CD" code="" displayName=""
                                   codeSystem="2.16.156.10011.2.3.1.85" codeSystemName="诊断代码表(ICD-10)"></value>
                        </observation>
                    </component>
                </organizer>
            </entry>

            <entry>
                <organizer classCode="CLUSTER" moodCode="EVN">
                    <statusCode/>
                    <component>
                        <observation classCode="OBS" moodCode="EVN">
                            <code code="DE05.10.172.00" displayName="中医病名名称"
                                  codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录">
                                <qualifier>
                                    <name displayName="中医病名名称"></name>
                                </qualifier>
                            </code>
                            <value xsi:type="ST">中医病名名称</value>
                        </observation>
                    </component>

                    <component>
                        <observation classCode="OBS" moodCode="EVN">
                            <code code="DE05.10.130.00" displayName="中医病名代码"
                                  codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录">
                                <qualifier>
                                    <name displayName="中医病名代码"></name>
                                </qualifier>
                            </code>
                            <value xsi:type="CD" code="" displayName=""
                                   codeSystem="2.16.156.10011.2.3.3.14" codeSystemName="中医病症分类与代码表(GB/T 15657)"></value>
                        </observation>
                    </component>
                </organizer>
            </entry>

            <entry>
                <organizer classCode="CLUSTER" moodCode="EVN">
                    <statusCode/>
                    <component>
                        <observation classCode="OBS" moodCode="EVN">
                            <code code="DE05.10.172.00" displayName="中医证候名称"
                                  codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录">
                                <qualifier>
                                    <name displayName="中医证候名称"></name>
                                </qualifier>
                            </code>
                            <value xsi:type="ST">中医证候名称</value>
                        </observation>
                    </component>

                    <component>
                        <observation classCode="OBS" moodCode="EVN">
                            <code code="DE05.10.130.00" displayName="中医证候代码"
                                  codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录">
                                <qualifier>
                                    <name displayName="中医证候代码"></name>
                                </qualifier>
                            </code>
                            <value xsi:type="CD" code="" displayName=""
                                   codeSystem="2.16.156.10011.2.3.3.14" codeSystemName="中医病症分类与代码表(GB/T 15657)"></value>
                        </observation>
                    </component>
                </organizer>
            </entry>
        </section>
    </component>

    <!-- 治疗计划章节 -->
    <component>
        <section>
            <code code="18776-5" displayName="TREATMENT PLAN"
                  codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
            <text/>
            <!-- 辨证依据描述 -->
            <entry>
                <observation classCode="OBS" moodCode="EVN">
                    <code code="DE05.10.132.00" displayName="辨证依据"
                          codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                    <value xsi:type="ST">辨证依据描述</value>
                </observation>
            </entry>
            <!-- 治则治法 -->
            <entry>
                <observation classCode="OBS" moodCode="EVN">
                    <code code="DE06.00.300.00" displayName="治则治法"
                          codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                    <value xsi:type="ST">自由文本</value>
                </observation>
            </entry>
        </section>
    </component>

    <!-- 医嘱章节 -->
    <component>
        <section>
            <code code="46209-3" displayName="Provider Orders"
                  codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
            <text/>

            <entry>
                <observation classCode="CLUSTER" moodCode="EVN">
                    <statusCode/>
                    <component>
                        <observation classCode="OBS" moodCode="EVN">
                            <code code="DE06.00.289.00" displayName="医嘱项目类型"
                                  codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                            <value xsi:type="CD" code=""
                                   codeSystem="2.16.156.10011.2.3.1.250" codeSystemName="医嘱项目类型代码表" displayName=""/>
                        </observation>
                    </component>

                    <component>
                        <observation classCode="OBS" moodCode="EVN">
                            <code code="DE06.00.288.00" displayName="医嘱项目内容"
                                  codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                            <effectiveTime>
                                <!-- 医嘱计划开始日期时间 -->
                                <low value=""/>
                                <!-- 医嘱计划结束日期时间 -->
                                <high value=""/>
                            </effectiveTime>
                            <!-- 医嘱计划信息 -->
                            <value xsi:type="ST">医嘱项目内容具体描述</value>
                            <!-- 执行者 -->
                            <performer>
                                <!-- 医嘱执行日期时间:DE06.00.222.00 -->
                                <time value=""/>
                                <assignedEntity>
                                    <id root="2.16.156.10011.1.4"/>
                                    <!-- 角色 -->
                                    <code displayName="医嘱执行者"/>
                                    <!-- 医嘱执行者签名:DE02.01.039.00 -->
                                    <assignedPerson>
                                        <name></name>
                                    </assignedPerson>
                                    <!-- 医嘱执行科室:DE08.10.026.00 -->
                                    <representedOrganization>
                                        <name></name>
                                    </representedOrganization>
                                </assignedEntity>
                            </performer>

                            <!-- 作者:医嘱开立者 -->
                            <author>
                                <!-- 医嘱开立日期时间:DE06.00.220.00 -->
                                <time value=""/>
                                <assignedAuthor>
                                    <id root="2.16.156.10011.1.4"/>
                                    <!-- 角色 -->
                                    <code displayName="医嘱开立者"/>
                                    <!-- 医嘱开立者签名:DE02.01.039.00 -->
                                    <assignedPerson>
                                        <name></name>
                                    </assignedPerson>
                                    <!-- 医嘱开立科室:DE08.10.026.00 -->
                                    <representedOrganization>
                                        <name></name>
                                    </representedOrganization>
                                </assignedAuthor>
                            </author>

                            <!-- 医嘱审核 -->
                            <participant typeCode="ATND">
                                <!-- 医嘱审核日期时间:DE06.00.205.00 -->
                                <time value=""/>
                                <participantRole classCode="ASSIGNED">
                                    <id root="2.16.156.10011.1.4"/>
                                    <!-- 角色 -->
                                    <code displayName="医嘱审核人"/>
                                    <!-- 医嘱审核人签名:DE02.01.039.00 -->
                                    <playingEntity classCode="PSN" determinerCode="INSTANCE">
                                        <name></name>
                                    </playingEntity>
                                </participantRole>
                            </participant>

                            <!-- 医嘱取消 -->
                            <participant typeCode="ATND">
                                <!-- 医嘱取消日期时间:DE06.00.234.00 -->
                                <time value=""/>
                                <participantRole classCode="ASSIGNED">
                                    <id root="2.16.156.10011.1.4"/>
                                    <!-- 角色 -->
                                    <code displayName="医嘱取消人"/>
                                    <!-- 取消医嘱者签名:DE02.01.039.00 -->
                                    <playingEntity classCode="PSN" determinerCode="INSTANCE">
                                        <name></name>
                                    </playingEntity>
                                </participantRole>
                            </participant>

                            <!-- 医嘱备注信息 -->
                            <entryRelationship typeCode="COMP">
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE06.00.179.00" displayName="医嘱备注信息"
                                          codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                                    <value xsi:type="ST">医嘱备注信息</value>
                                </observation>
                            </entryRelationship>

                            <!-- 医嘱执行状态 -->
                            <entryRelationship typeCode="COMP">
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE06.00.290.00" displayName="医嘱执行状态"
                                          codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                                    <value xsi:type="ST">医嘱执行状态</value>
                                </observation>
                            </entryRelationship>
                        </observation>
                    </component>
                </observation>
            </entry>
        </section>
    </component>
</ClinicalDocument>