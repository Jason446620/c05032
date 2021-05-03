using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class student : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Show_Click(object sender, EventArgs e)
        {
            List<string> list = new List<string>();
            string[] imglist_session = Session["imglist"].ToString().Split(new string[] { "|" }, StringSplitOptions.RemoveEmptyEntries);
            //从数据库中读取dt字段为ImageUrl内容，具体可debug看数据格式
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