/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


$(document).ready(function() {
        $('#studentName').blur(function(event) {
                var name = $('#studentName').val();
                $.get('GetUserServlet', {
                        userName : name
                }, function(responseText) {
                        $('#ajaxGetUserServletResponse').text(responseText);
                });
        });
});