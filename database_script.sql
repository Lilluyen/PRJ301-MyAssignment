-- ===========================================
-- DATABASE: SonntCompany
-- ===========================================


-- ===========================================
-- 1. BẢNG PHÒNG BAN (DIVISION)
-- ===========================================
CREATE TABLE Division (
    DivisionID INT IDENTITY(1,1) PRIMARY KEY,
    DivisionName NVARCHAR(100) NOT NULL
);
GO

-- ===========================================
-- 2. BẢNG NGƯỜI DÙNG (USER)
-- ===========================================
CREATE TABLE [User] (
    UserID INT IDENTITY(1,1) PRIMARY KEY,
    Username NVARCHAR(50) NOT NULL UNIQUE,
    [Password] NVARCHAR(100) NOT NULL,
    FullName NVARCHAR(100) NOT NULL,
    DivisionID INT NOT NULL,
    CONSTRAINT FK_User_Division FOREIGN KEY (DivisionID)
        REFERENCES Division(DivisionID)
);
GO

-- ===========================================
-- 3. BẢNG VAI TRÒ (ROLE)
-- ===========================================
CREATE TABLE [Role] (
    RoleID INT IDENTITY(1,1) PRIMARY KEY,
    RoleName NVARCHAR(50) NOT NULL UNIQUE
);
GO

-- ===========================================
-- 4. BẢNG QUAN HỆ USER - ROLE (N-N)
-- ===========================================
CREATE TABLE UserRole (
    UserID INT NOT NULL,
    RoleID INT NOT NULL,
    PRIMARY KEY (UserID, RoleID),
    FOREIGN KEY (UserID) REFERENCES [User](UserID),
    FOREIGN KEY (RoleID) REFERENCES [Role](RoleID)
);
GO

-- ===========================================
-- 5. BẢNG CHỨC NĂNG (FEATURE)
-- ===========================================
CREATE TABLE Feature (
    FeatureID INT IDENTITY(1,1) PRIMARY KEY,
    FeatureName NVARCHAR(100) NOT NULL,
    [Path] NVARCHAR(200) NULL
);
GO

-- ===========================================
-- 6. BẢNG QUAN HỆ ROLE - FEATURE (N-N)
-- ===========================================
CREATE TABLE RoleFeature (
    RoleID INT NOT NULL,
    FeatureID INT NOT NULL,
    PRIMARY KEY (RoleID, FeatureID),
    FOREIGN KEY (RoleID) REFERENCES [Role](RoleID),
    FOREIGN KEY (FeatureID) REFERENCES Feature(FeatureID)
);
GO

-- ===========================================
-- 7. BẢNG YÊU CẦU NGHỈ PHÉP (LEAVE REQUEST)
-- ===========================================
CREATE TABLE LeaveRequest (
    RequestID INT IDENTITY(1,1) PRIMARY KEY,
    Title NVARCHAR(200) NOT NULL,
    FromDate DATE NOT NULL,
    ToDate DATE NOT NULL,
    Reason NVARCHAR(500),
    Status NVARCHAR(50) CHECK (Status IN ('InProgress', 'Approved', 'Rejected')) DEFAULT 'InProgress',
    CreatedBy INT NOT NULL,
    ProcessedBy INT NULL,
    CreatedDate DATETIME DEFAULT GETDATE(),
    ProcessedDate DATETIME NULL,
    CONSTRAINT FK_LeaveRequest_CreatedBy FOREIGN KEY (CreatedBy)
        REFERENCES [User](UserID),
    CONSTRAINT FK_LeaveRequest_ProcessedBy FOREIGN KEY (ProcessedBy)
        REFERENCES [User](UserID)
);
GO

-- ===========================================
-- 8. DỮ LIỆU MẪU
-- ===========================================

-- Phòng ban
INSERT INTO Division (DivisionName)
VALUES (N'IT'), (N'QA'), (N'Sales');

-- Vai trò
INSERT INTO [Role] (RoleName)
VALUES (N'Division Leader'), (N'Trưởng nhóm'), (N'Nhân viên');

-- Người dùng
INSERT INTO [User] (Username, [Password], FullName, DivisionID)
VALUES 
('mra', '123', N'Mr A', 1),
('mrb', '123', N'Mr B', 1),
('mrc', '123', N'Mr C', 2),
('mrd', '123', N'Mr D', 3),
('mre', '123', N'Mr E', 1);

-- Gán vai trò
INSERT INTO UserRole VALUES 
(1, 1),  -- Mr A là Division Leader
(2, 2),  -- Mr B là Trưởng nhóm
(3, 3),  -- Mr C là Nhân viên
(4, 3),  -- Mr D là Nhân viên
(5, 3);  -- Mr E là Nhân viên

-- Chức năng
INSERT INTO Feature (FeatureName, [Path]) VALUES
(N'Tạo đơn xin nghỉ phép', '/request/create'),
(N'Xem danh sách đơn', '/request/list'),
(N'Duyệt đơn nghỉ phép', '/request/approve'),
(N'Xem agenda phòng', '/agenda'),
(N'Đăng nhập', '/login');

-- Phân quyền tính năng cho vai trò
INSERT INTO RoleFeature VALUES
(1,1),(1,2),(1,3),(1,4),(1,5),   -- Division Leader
(2,1),(2,2),(2,3),(2,5),        -- Trưởng nhóm
(3,1),(3,2),(3,5);              -- Nhân viên

-- Đơn nghỉ phép mẫu
INSERT INTO LeaveRequest (Title, FromDate, ToDate, Reason, CreatedBy, Status)
VALUES 
(N'Xin nghỉ cưới', '2025-01-01', '2025-01-03', N'Nghỉ cưới', 5, 'InProgress'),
(N'Xin nghỉ du lịch', '2025-01-10', '2025-01-12', N'Nghỉ phép năm', 3, 'Rejected'),
(N'Nghỉ khám bệnh', '2025-01-15', '2025-01-16', N'Bị ốm', 4, 'Approved');
GO
