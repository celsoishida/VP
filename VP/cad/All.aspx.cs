using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Text;
using System.Diagnostics;

namespace VP.tab
{
    public partial class TAll : System.Web.UI.Page
    {
        protected void ButtonLimpar_Click(object sender, EventArgs e)
        {
            LabelMensagem.Text = "";
            TextBoxCodigo.Text = "";
            TextBoxDescricao.Text = "";
        }

        protected void ButtonPesquisar_Click(object sender, EventArgs e)
        {
            LabelMensagem.Text = "";
            StringBuilder errorMessages = new StringBuilder();

            SqlCommand sqlComando;
            SqlConnection sqlConexao = new SqlConnection(CYI.connectionString);

            sqlComando = new SqlCommand();
            sqlConexao.Open();
            sqlComando.Connection = sqlConexao;
            sqlComando.CommandText = @"select codigo, descricao from " + TextBoxTabela.Text;
            if (TextBoxCodigo.Text != "")
            {
                sqlComando.CommandText = sqlComando.CommandText + " where codigo = " + TextBoxCodigo.Text;
                // sqlComando.Parameters.Add(new SqlParameter("@Codigo", SqlDbType.Int)).Value = Convert.ToInt32(TextBoxCodigo.Text);
            }
            try
            {
                SqlDataReader sdr = sqlComando.ExecuteReader();

                //            do {
                while (sdr.Read())
                {
                    TextBoxCodigo.Text = sdr["Codigo"].ToString();
                    TextBoxDescricao.Text = sdr["Descricao"].ToString();
                    LabelMensagem.Text = "Ok";
                }
                //            } while ( sdr.NextResult());
            }
            catch (SqlException ex)
            {
                for (int i = 0; i < ex.Errors.Count; i++)
                {
                    errorMessages.Append("Index #" + i + "\n" +
                        "Message: " + ex.Errors[i].Message + "\n" + "LineNumber: " + ex.Errors[i].LineNumber + "\n" +
                        "Source: " + ex.Errors[i].Source + "\n" +
                        "Procedure: " + ex.Errors[i].Procedure + "\n");
                }
                Console.WriteLine(errorMessages.ToString());
                Debug.WriteLine(errorMessages.ToString());
                LabelMensagem.Text = errorMessages.ToString();

            }
            catch (Exception e2)
            {
                Console.WriteLine("{0} Exception caught.", e2);
                Debug.WriteLine("{0} Exception caught.", e2);

                LabelMensagem.Text = e2.ToString();
            }

            sqlComando.Dispose();
            sqlConexao.Close();
        }

        protected void ButtonSalvar_Click(object sender, EventArgs e)
        {

            LabelMensagem.Text = "";
            SalvarUm(sender, e);
        }
        protected bool SalvarUm(object sender, EventArgs e)
        {
            StringBuilder errorMessages = new StringBuilder();

            SqlCommand sqlComando;
            SqlConnection sqlConexao = new SqlConnection(CYI.connectionString);

            sqlComando = new SqlCommand();
            sqlConexao.Open();
            sqlComando.Connection = sqlConexao;
            //sqlComando.CommandType = CommandType.StoredProcedure;
            sqlComando.CommandText = "insert into " + TextBoxTabela.Text + " select " + TextBoxCodigo.Text + ", '" + TextBoxDescricao.Text + "' select SCOPE_IDENTITY() as Codigo";
            //sqlComando.CommandText = @"TipoEstabelecimentoIU";
            /*if (TextBoxCodigo.Text != "")
            {
                sqlComando.Parameters.Add(new SqlParameter("@Codigo", SqlDbType.Int)).Value = Convert.ToInt32(TextBoxCodigo.Text);
            }
            if (TextBoxDescricao.Text != "")
            {
                sqlComando.Parameters.Add(new SqlParameter("@Descricao", SqlDbType.Text)).Value = TextBoxDescricao.Text;
            }*/

            try
            {
                SqlDataReader sdr = sqlComando.ExecuteReader();

                //            do {
                while (sdr.Read())
                {
                    TextBoxCodigo.Text = sdr["Codigo"].ToString();
                    LabelMensagem.Text = "Ok";
                }
                //            } while ( sdr.NextResult());
            }
            catch (SqlException ex)
            {
                for (int i = 0; i < ex.Errors.Count; i++)
                {
                    errorMessages.Append("Index #" + i + "\n" +
                        "Message: " + ex.Errors[i].Message + "\n" + "LineNumber: " + ex.Errors[i].LineNumber + "\n" +
                        "Source: " + ex.Errors[i].Source + "\n" +
                        "Procedure: " + ex.Errors[i].Procedure + "\n");
                }
                Console.WriteLine(errorMessages.ToString());
                Debug.WriteLine(errorMessages.ToString());
                LabelMensagem.Text = errorMessages.ToString();
                return false;
            }
            catch (Exception e2)
            {
                Console.WriteLine("{0} Exception caught.", e2);
                Debug.WriteLine("{0} Exception caught.", e2);

                LabelMensagem.Text = e2.ToString();
                return false;
            }

            sqlComando.Dispose();
            sqlConexao.Close();
            return true;
        }

        protected void ButtonExcluir_Click(object sender, EventArgs e)
        {
            LabelMensagem.Text = "";
            StringBuilder errorMessages = new StringBuilder();

            SqlCommand sqlComando;
            SqlConnection sqlConexao = new SqlConnection(CYI.connectionString);

            sqlComando = new SqlCommand();
            sqlConexao.Open();
            sqlComando.Connection = sqlConexao;
            sqlComando.CommandType = CommandType.StoredProcedure;
            sqlComando.CommandText = @"TipoEstabelecimentoD";
            if (TextBoxCodigo.Text == "")
            {
                LabelMensagem.Text = "É preciso informar o campo Codigo da tabela TipoEstabelecimento para exclusão!";
                return;
            }
            sqlComando.Parameters.Add(new SqlParameter("@Codigo", SqlDbType.Int)).Value = Convert.ToInt32(TextBoxCodigo.Text);
            try
            {
                sqlComando.ExecuteReader();
                if (!CheckBoxApagar.Checked)
                    ButtonLimpar_Click(sender, e);
                LabelMensagem.Text = "Excluído!";
            }
            catch (SqlException ex)
            {
                for (int i = 0; i < ex.Errors.Count; i++)
                {
                    errorMessages.Append("Index #" + i + "\n" +
                        "Message: " + ex.Errors[i].Message + "\n" + "LineNumber: " + ex.Errors[i].LineNumber + "\n" +
                        "Source: " + ex.Errors[i].Source + "\n" +
                        "Procedure: " + ex.Errors[i].Procedure + "\n");
                }
                Console.WriteLine(errorMessages.ToString());
                Debug.WriteLine(errorMessages.ToString());
                LabelMensagem.Text = errorMessages.ToString();

            }
            catch (Exception e2)
            {
                Console.WriteLine("{0} Exception caught.", e2);
                Debug.WriteLine("{0} Exception caught.", e2);

                LabelMensagem.Text = e2.ToString();
            }

            sqlComando.Dispose();
            sqlConexao.Close();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                TextBoxCodigo.Text = Request.Params["T"];
            }
        }

        protected void ButtonSalvarVarios_Click(object sender, EventArgs e)
        {
            string linha = TextBoxVarios.Text;
            char[] delimiters = new char[] { '\r', '\n' };
            string[] parts = linha.Split(delimiters, StringSplitOptions.RemoveEmptyEntries);

            if (CheckBoxApagar.Checked)
            {
                TextBoxCodigo.Text = "";
                ButtonExcluir_Click(sender, e);
            }

            LabelMensagem.Text = "";
            for (int i = 0; i < parts.Length; i++)
            {
                char[] delimiters2 = new char[] { '\t', ';' };
                string[] colunas = parts[i].Split(delimiters2, StringSplitOptions.RemoveEmptyEntries);

                TextBoxCodigo.Text = colunas[0];
                TextBoxDescricao.Text = colunas[1];
                if (!SalvarUm(null, e))
                    break;
            }

            GridViewTipoEstabelecimento.DataBind();
        }

    }
}