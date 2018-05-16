- active = context.request.path == "/" ? "active" : ""
a class="nav-item #{active}" href="/" Home
- active = context.request.path == "/pets" ? "active" : ""
a class="nav-item #{active}" href="/pets" Pets
