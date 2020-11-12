create table khoa
(
    ma_khoa  int identity
        constraint KHOA_pk
            primary key nonclustered,
    ten_khoa nvarchar(255)
)
go

create table giao_vien
(
    ma_giao_vien  int identity
        constraint giao_vien_pk
            primary key nonclustered,
    ten_giao_vien nvarchar(255),
    gioi_tinh     nvarchar(10),
    ngay_sinh     timestamp null,
    dia_chi       nvarchar(255),
    so_dien_thoai varchar(15),
    ma_khoa       int
        constraint giao_vien_khoa_ma_khoa_fk
            references khoa
)
go

create unique index giao_vien_ma_giao_vien_uindex
    on giao_vien (ma_giao_vien)
go

create unique index KHOA_ma_khoa_uindex
    on khoa (ma_khoa)
go

create table lop_chu_nhiem
(
    ma_lop  int identity
        constraint lop_chu_nhiem_pk
            primary key nonclustered,
    ten_lop nvarchar(255),
    si_so   int default 0,
    ma_khoa int
        constraint lop_chu_nhiem_khoa_ma_khoa_fk
            references khoa
)
go

create unique index lop_chu_nhiem_ma_lop_uindex
    on lop_chu_nhiem (ma_lop)
go

create table mon_hoc
(
    ma_mon_hoc  int identity
        constraint MONHOC_pk
            primary key nonclustered,
    ten_mon_hoc nvarchar(255),
    so_tin_chi  int,
    ma_khoa     int
        constraint mon_hoc_khoa_ma_khoa_fk
            references khoa
)
go

create table lop_hoc_phan
(
    ma_lop_hoc_phan int not null
        constraint hoc_phan_pk
            primary key nonclustered,
    hoc_ki          varchar(3),
    ma_giao_vien    int
        constraint lop_hoc_phan_giao_vien_ma_giao_vien_fk
            references giao_vien,
    ma_mon_hoc      int
        constraint lop_hoc_phan_mon_hoc_ma_mon_hoc_fk
            references mon_hoc,
    nam_hoc         varchar(10)
)
go

create unique index hoc_phan_ma_hoc_phan_uindex
    on lop_hoc_phan (ma_lop_hoc_phan)
go

create unique index MONHOC_ma_mon_hoc_uindex
    on mon_hoc (ma_mon_hoc)
go

create table sinh_vien
(
    ma_sinh_vien    int identity
        constraint sinh_vien_pk
            primary key nonclustered,
    ten_sinh_vien   nvarchar(255),
    gioi_tinh       nvarchar(3),
    ngay_sinh       timestamp null,
    dia_chi         nvarchar(255),
    so_dien_thoai   nvarchar(15),
    ma_lop_hoc_phan int
        constraint sinh_vien_lop_hoc_phan_ma_lop_hoc_phan_fk
            references lop_hoc_phan
)
go

create table diem
(
    ma_sinh_vien    int
        constraint diem_sinh_vien_ma_sinh_vien_fk
            references sinh_vien,
    ma_lop_hoc_phan int
        constraint diem_lop_hoc_phan_ma_lop_hoc_phan_fk
            references lop_hoc_phan,
    diem_cc         int,
    diem_tx         int,
    diem_thi        int,
    diem_tb         int
)
go

create unique index sinh_vien_ma_sinh_vien_uindex
    on sinh_vien (ma_sinh_vien)
go


