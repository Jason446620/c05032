<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="student.aspx.cs" Inherits="WebApplication1.student" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>学生页面</title>
    <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
    <script type="text/javascript">
        function openimg(content) {
            const img = new Image();
            img.src = content;
            img.width = 1300;
            img.height = 600;
            const newWin = window.open("", "_blank", "width:1366px,height:768px");
            newWin.document.write(img.outerHTML);
            newWin.document.title = "大图"
            newWin.document.close();
        }
    </script>
    <style>
    </style>
</head>
<body>
    <h2>学生.aspx</h2>
    <form id="form1" runat="server">
        <div>
            <asp:Button runat="server" ID="Button1" OnClick="Show_Click" Text="展现repeater数据"    />
        </div>
        <div>
            <asp:Repeater ID="Repeater" runat="server">
                <ItemTemplate> 
                    <%--具体一行方济各按照width进行调整--%>
                    <%--<asp:Image ID="Image1" height="280" width="280" runat="server" ImageUrl='<%# Eval("ImageUrl") %>' onClick="openimg('<%# Eval("ImageUrl") %>')" /> --%>
                    <img alt="image" style="text-align: center; height:280px; width:280px" src='<%#Eval("ImageUrl")%>' onclick="openimg('<%# Eval("ImageUrl") %>')" />
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </form>
</body>
</html>
