<header>
    <nav class="navbar navbar-inverse">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.jsp">Peonie Wedding Organizer</a>
            </div>
			
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
					<li <% if(active==1) out.print("class='active'"); %>>
                        <a href="index.jsp">Home</a>
                    </li>
                    <li <% if(active==2) out.print("class='active'"); %>>
                        <a href="hall.jsp">Wedding Hall</a>
                    </li>
					<li <% if(active==3) out.print("class='active'"); %>>
                        <a href="decoration.jsp">Decoration</a>
                    </li>
					<li <% if(active==4) out.print("class='active'"); %>>
                        <a href="event.jsp">Wedding Event</a>
                    </li>
				<% if(session.getAttribute("sessionId")==null){ %>
					<li <% if(active==5) out.print("class='active'"); %>>
                        <a href="login.jsp">Login</a>
                    </li>
				<% } else if(session.getAttribute("sessionId")!=null){ %>
					<li <% if(active==6) out.print("class='active'"); %>>
                        <a href="editProfile.jsp">My Profile</a>
                    </li>
					<li <% if(active==7) out.print("class='active'"); %>>
                        <a href="member.jsp">Member</a>
                    </li>
					<li>
                        <a href="controller/doLogout.jsp">Logout</a>
                    </li>
				<% } %>
                </ul>
            </div>
        </div>
    </nav>
</header>