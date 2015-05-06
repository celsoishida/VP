using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VP
{
    public partial class escolhaInicial : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Session["Evento"] = DropDownListEvento.SelectedValue.ToString();
            Session["EventoVersao"] = DropDownListEventoVersao.SelectedValue.ToString();

            Response.Redirect( TextBox1.Text);
        }
    }
}