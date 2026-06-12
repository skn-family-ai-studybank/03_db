# TCL(Transaction Control Language)
# - 트랜잭션 제어 언어
# - COMMIT, ROLLBACK, SAVEPOINT 등이 있음

# Transaction이란?
# - 한 번에 수행될 DML 작업 단위
# 하나의 트랜잭션을 이용해서 관련 작업을
# 한 번에 완료 또는 취소할 수 있게 하기 위해서 사용

# MySQL은 기본적으로 Autocommit이 활성화 상태

set autocommit = ON;
set autocommit = OFF;

# COMMIT : DML로 인한 변경사항(Transaction)을 DB에 반영
# ROLLBACK : DML 변경 사항을 취소 (Transaction 내부 내용 폐기)

# 트랜잭션 시작 == 이후 실행되는 DML 구문을 트랜잭션에 저장
# 트랜잭션 종료 == COMMIT, ROLLBACK이 종료 커맨드
start transaction; # autuocommit이 활성화 되어도 사용 가능

select *
from tbl_menu
where menu_code = 21;

# 판매 가능 여부 Y -> N 수정
update tbl_menu
set orderable_status = 'N'
where menu_code = 21;
# ======================================================================
delete
from tbl_menu
where menu_code = 20;

INSERT into tbl_menu
values(null,
       'TX테스트',
       3000,
       5,
       'N');
# ========================================================================
# 수정 후 COMMIT 을 수행하지 않았는데
# 조회 시 수정 내용이 반영된 것 처럼 보이는 이유
# -> 실제 DB애 반영은 안됐지만, 조회 시
#    트랜잭션에 저장된 DML 구문을 반영해서 보여줌
select *
from tbl_menu
where menu_code = 21;

ROLLBACK; # 변경사항 폐기

select *
from tbl_menu;
# ======================================================================
# menu_code = 100 삭제 후 DB 반영

delete
from tbl_menu
where menu_code = 100;

commit;

select *
from tbl_menu;
# ============================================================================
# commit된 내용은 rollback 될까? X
rollback;

select *
from tbl_menu;