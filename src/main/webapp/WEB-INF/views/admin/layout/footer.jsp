<%-- 
    Document   : footer
    Created on : Jun 11, 2025, 2:27:30 PM
    Author     : ADMIN
--%>

<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>

<!-- Bootstrap 5 JS and dependencies -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script>
    // Toggle sidebar for mobile
    document.querySelector('.toggle-btn').addEventListener('click', () => {
        document.querySelector('.sidebar').classList.toggle('active');
    });
</script>
</body>
</html>