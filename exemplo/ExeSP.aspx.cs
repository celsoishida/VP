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

public partial class ExeSP : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            TextBoxCodigo.Text = Request.Params["U"];
        }

    }
    protected void ButtonLimpar_Click(object sender, EventArgs e)
    {
        LabelMensagem.Text = "";
        TextBoxCodigo.Text = "";
        TextBoxDescricao.Text = "";
        TextBoxSigla.Text = "";
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
        sqlComando.CommandType = CommandType.StoredProcedure;
        sqlComando.CommandText = @"UniversidadeS";
        if (TextBoxCodigo.Text != "")
        {
            sqlComando.Parameters.Add(new SqlParameter("@Codigo", SqlDbType.Int)).Value = Convert.ToInt32(TextBoxCodigo.Text);
        }
        try
        {
            SqlDataReader sdr = sqlComando.ExecuteReader();

            //            do {
            while (sdr.Read())
            {
                TextBoxCodigo.Text = sdr["Codigo"].ToString();
                TextBoxDescricao.Text = sdr["Descricao"].ToString();
                TextBoxSigla.Text = sdr["Sigla"].ToString();
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
        StringBuilder errorMessages = new StringBuilder();

        SqlCommand sqlComando;
        SqlConnection sqlConexao = new SqlConnection(CYI.connectionString);

        sqlComando = new SqlCommand();
        sqlConexao.Open();
        sqlComando.Connection = sqlConexao;
        sqlComando.CommandType = CommandType.StoredProcedure;
        sqlComando.CommandText = @"UniversidadeIU";
        if (TextBoxCodigo.Text != "")
        {
            sqlComando.Parameters.Add(new SqlParameter("@Codigo", SqlDbType.Int)).Value = Convert.ToInt32(TextBoxCodigo.Text);
        }
        if (TextBoxDescricao.Text != "")
        {
            sqlComando.Parameters.Add(new SqlParameter("@Descricao", SqlDbType.Text)).Value = TextBoxDescricao.Text;
        }
        if (TextBoxSigla.Text != "")
        {
            sqlComando.Parameters.Add(new SqlParameter("@Sigla", SqlDbType.Text)).Value = TextBoxSigla.Text;
        }
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
        sqlComando.CommandText = @"UniversidadeD";
        if (TextBoxCodigo.Text == "")
        {
            LabelMensagem.Text = "É preciso informar o campo Codigo da tabela Universidade para exclusão!";
            return;
        }
        sqlComando.Parameters.Add(new SqlParameter("@Codigo", SqlDbType.Int)).Value = Convert.ToInt32(TextBoxCodigo.Text);
        try
        {
            sqlComando.ExecuteReader();
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

}