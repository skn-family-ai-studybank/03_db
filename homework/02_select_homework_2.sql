# 재직 중이고
# 휴대폰 마지막 자리가 2인 직원 중
# 입사일이 가장 최근인 직원 3명의
# 사원번호, 직원명, 전화번호, 입사일, 퇴직여부를 출력하세요.
# 참고. 퇴사한 직원은 퇴직여부 컬럼값이 ‘Y’이고, 재직 중인 직원의 퇴직여부 컬럼값은 ‘N’

SELECT
    EMP_ID, EMP_NAME, PHONE, HIRE_DATE, ENT_YN
FROM
    employee
WHERE
    ENT_YN = 'N'
AND
    PHONE LIKE '%2'
ORDER BY
    HIRE_DATE DESC
LIMIT 3;


# 재직 중인 ‘대리’들의 직원명, 직급명, 급여, 사원번호, 이메일, 전화번호, 입사일을 출력하세요.
# 단, 급여를 기준으로 내림차순 출력하세요.

select
    e.EMP_NAME as 직원명,
    j.JOB_NAME as 직급명,
    e.SALARY as 급여,
    e.EMP_ID as 사원번호,
    e.EMAIL as 이메일,
    e.PHONE as 전화번호,
    e.HIRE_DATE as 입사일
from
    employee e
join
    job j
on
    j.JOB_CODE = e.JOB_CODE
where
    j.JOB_NAME = '대리'
and
    e.ENT_YN = 'N'
order by
    SALARY desc;

