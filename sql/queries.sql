{\rtf1\ansi\ansicpg1252\cocoartf2865
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\paperw11900\paperh16840\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0

\f0\fs24 \cf0 -- Cambridgeshire Primary Schools Analysis\
-- Data: DfE School Census and KS2 Attainment 2024-25\
\
-- Query 1: Average attainment by constituency\
SELECT \
    PCON_NAME,\
    COUNT(*) as num_schools,\
    ROUND(AVG(PTRWM_EXP), 1) as avg_expected_standard,\
    ROUND(AVG(PNUMFSMEVER), 1) as avg_fsm_pct,\
    ROUND(AVG(TSENELSE), 1) as avg_ehc_pupils\
FROM primary_schools\
GROUP BY PCON_NAME\
ORDER BY avg_expected_standard DESC;\
\
-- Query 2: Schools with highest SEND need vs attainment\
SELECT \
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0
\cf0     SCHNAME,\
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0
\cf0     PCON_NAME,\
    TSENELSE,\
    TSENELK_x,\
    (TSENELSE + TSENELK_x) as total_send,\
    PTRWM_EXP,\
    READ_AVERAGE,\
    MAT_AVERAGE\
FROM primary_schools\
WHERE PTRWM_EXP IS NOT NULL\
ORDER BY total_send DESC\
LIMIT 15;\
\
-- Query 3: EHC pupils as percentage of school roll by constituency\
SELECT \
    PCON_NAME,\
    COUNT(*) as num_schools,\
    ROUND(AVG(NOR), 0) as avg_school_size,\
    ROUND(AVG(TSENELSE), 1) as avg_ehc_pupils,\
    ROUND(AVG(TSENELSE * 100.0 / NOR), 1) as ehc_pct_of_roll\
FROM primary_schools\
GROUP BY PCON_NAME\
ORDER BY ehc_pct_of_roll DESC;\
\
-- Query 4: School attainment vs area average using CTE\
WITH school_summary AS (\
    SELECT \
        PCON_NAME,\
        SCHNAME,\
        PTRWM_EXP,\
        PNUMFSMEVER,\
        AVG(PTRWM_EXP) OVER (PARTITION BY PCON_NAME) as area_avg_attainment\
    FROM primary_schools\
    WHERE PTRWM_EXP IS NOT NULL\
)\
SELECT \
    PCON_NAME,\
    SCHNAME,\
    PTRWM_EXP as school_attainment,\
    ROUND(area_avg_attainment, 1) as area_average,\
    ROUND(PTRWM_EXP - area_avg_attainment, 1) as vs_area_average\
FROM school_summary\
ORDER BY PCON_NAME, vs_area_average DESC;}