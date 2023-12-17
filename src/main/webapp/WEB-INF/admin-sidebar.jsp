<div class="sidebar">
    <div class="logo-details">
        <i class="fa-solid fa-toolbox icon"></i>
        <div class="logo_name">Admin</div>
        <i class="fa-solid fa-bars" id="btn"></i>
    </div>

    <ul class="nav-list">
        <li>
            <i class="fa-solid fa-magnifying-glass bx-search"></i>
            <input type="text" placeholder="Search...">
            <span class="tooltip">Search</span>
        </li>
        <li>
            <a href="${pageContext.request.contextPath}/">
            <i class="fa-solid fa-table-cells-large"></i>
            <span class="links_name">Website</span>
            </a>
            <span class="tooltip">Website</span>
        </li>
        <li>
            <a href="${pageContext.request.contextPath}/admin/users">
                <i class="fa-regular fa-user"></i>
                <span class="links_name">Users</span>
            </a>
            <span class="tooltip">Users</span>
        </li>
        <li>
            <a href="${pageContext.request.contextPath}/admin/games">
                <i class="fa-solid fa-gamepad"></i>
                <span class="links_name">Games</span>
            </a>
            <span class="tooltip">Games</span>
        </li>
        <li class="profile">
            <div class="profile-details">
            <i class="fa-solid fa-user"></i>
            <div class="name_job">
                <div class="name">${user.userName}</div>
            </div>
            </div>
            <i class="fa-solid fa-right-from-bracket" id="log_out"></i>
        </li>
    </ul>
</div>