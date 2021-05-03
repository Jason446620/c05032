using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class giffuc : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session["imglist"] = "";
            }

            //请仔细查看注释，因为没有地方存储你的上传图片数据，所以我存放在session中
            // session中的存放内容有限，按照我的代码提示，将图片数据存入数据库中即可

        }

        protected void SaveImg_Click(object sender, EventArgs e)
        {
            string Img = base64img.Value;
            //gif 前端已转成base64格式，是字符串类型，存入数据库即可，数据库字段设置为nvarchar（max）
            // 数据库示例 该有字段
            // ID , 上传者id， 上传时间，....... ,上传内容ImageUrl（即Img，把字符串存入即可）
            //这里模拟数据存入了session
            Session["imglist"] = Session["imglist"] + Img+"|";
            //正确的应该是存入数据库
            //类似于下面的sq1语法 insert into table表名 values ('','','')
        }

        protected void Show_Click(object sender, EventArgs e)
        {
            //这个方法中，读取存放在数据库中的数据
            List<string> list = new List<string>();
            //我的示例代码，因为存入session，所以从session中再取出，正确的应该是从数据库取出
            string[] imglist_session = Session["imglist"].ToString().Split(new string[] { "|" }, StringSplitOptions.RemoveEmptyEntries);
            //从数据库中读取dt字段为ImageUrl内容，具体可debug看数据格式，ImageUrl于前端<%# Eval("ImageUrl") %> 相对应
            //因为是模拟数据，所以我只能自己手动创建datatable创建
            //你的代码中 应该直接就会有 DataTable dt= sqlhelper.executeDatatable("SELECT *FROM 表名");这样的相似的代码
            DataTable dt = new DataTable();
            dt.Columns.Add("ImageUrl");
            
            for (int i = 0; i < imglist_session.Length; i++)
            {
                DataRow dr = dt.NewRow();
                list.Add(imglist_session[i]);
                dr["ImageUrl"] = imglist_session[i];
                dt.Rows.Add(dr);
            }
            Repeater.DataSource = dt;
            
            Repeater.DataBind();
        }
    }
}