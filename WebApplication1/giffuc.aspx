<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="giffuc.aspx.cs" Inherits="WebApplication1.giffuc" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
    <script type="text/javascript">
        function showpreview1(input) {

            if (input.files && input.files[0]) {

                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#imgpreview').css('visibility', 'visible');
                    $('#imgpreview').attr('src', e.target.result);
                }
                reader.readAsDataURL(input.files[0]);
                alert(reader.result);
            }

        }
        function convertbase64() {
            var file = document.getElementById("fuimage").files[0];
            var reader = new FileReader();
            reader.onloadend = function () {
                //console.log('RESULT', reader.result)
                var img = document.getElementById('imgpreview');
                $('#imgpreview').css('visibility', 'visible');
                img.setAttribute('src', reader.result); // 修改img标签src属性值
                img.setAttribute('width', "220px");
                img.setAttribute('height', "180px");
                $("#base64img").val(reader.result);
            }
            reader.readAsDataURL(file);
        }
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
    <h2>教师.aspx</h2>
    <form id="form1" runat="server">
        <input  type="text" id="base64img" hidden="hidden" runat="server"/>
        <div>
            <div>选择图片：</div><br />
            <div><asp:FileUpload id="fuimage" runat="server" onchange="convertbase64(this);" /></div>
            <br />
            <div>预览图片：</div><br />
            <div><img id="imgpreview" height="200" width="200" src="" style="border-width: 0px; visibility: hidden;" /></div>
            <asp:Button runat="server" ID="savebutton" OnClick="SaveImg_Click" Text="上传保存"    />
        </div>
        <div>
            <asp:Button runat="server" ID="Button1" OnClick="Show_Click" Text="展现repeater数据"    />
        </div>
        <div>
            <asp:Repeater ID="Repeater" runat="server">
                <ItemTemplate> 
                    <%--具体一行方济各按照width进行调整--%>
                    <%--<asp:Image ID="Image1" height="280" width="280" runat="server" ImageUrl='<%# Eval("ImageUrl") %>' onClick="openimg('<%# Eval("ImageUrl") %>')" /> --%>
                    <img alt="image" style="text-align: center" src='<%#Eval("ImageUrl")%>' onclick="openimg('<%# Eval("ImageUrl") %>')" />
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </form>
</body>
</html>
