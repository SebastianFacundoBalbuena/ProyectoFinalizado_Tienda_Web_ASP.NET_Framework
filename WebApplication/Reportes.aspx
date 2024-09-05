<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Reportes.aspx.cs" Inherits="WebApplication.Reportes" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="card text-center">
        <div class="card-header"></div>
        <div class="card-body">
            <h2 class="card-title">Reporte de ventas</h2>
            <asp:Button Text="Volver" CssClass="btn btn-primary" runat="server" ID="Inicio" OnClick="Inicio_Click" />
        </div>
        <div class="card-footer text-body-secondary"></div>
    </div>
    <br />
    <asp:Label Text="Buscar año : " Style="font-size: 20px; margin-left: 250px;" runat="server" />
    <asp:DropDownList ID="barraAño" runat="server" CssClass="form-control" Style="width: 100px; margin-left: 250px;" AutoPostBack="true" OnSelectedIndexChanged="barraAño_SelectedIndexChanged">
    </asp:DropDownList>

    <asp:ScriptManager runat="server" />
    <asp:UpdatePanel runat="server">
        <ContentTemplate>

            <script type="text/javascript">

                // Load the Visualization API and the corechart package.
                google.charts.load('current', { 'packages': ['corechart'] });

                // Set a callback to run when the Google Visualization API is loaded.
                google.charts.setOnLoadCallback(drawChart);

                // Callback that creates and populates a data table,
                // instantiates the pie chart, passes in the data and
                // draws it.
                function drawChart() {

                    // Create the data table.
                    var data = new google.visualization.DataTable();
                    data.addColumn('string', 'Topping');
                    data.addColumn('number', 'Mes');
                    data.addRows(<%=ObtenerDatos()%>);

                    // Set chart options
                    var options = {
                        'title': 'Reporte de ventas',
                        'width': 600,
                        'height': 470
                    };

                    // Instantiate and draw our chart, passing in some options.
                    var chart = new google.visualization.ColumnChart(document.getElementById('chart_div'));
                    chart.draw(data, options);
                }
            </script>

            <div style="display: flex; justify-content: center; overflow: hidden; flex-wrap: wrap; gap: 10px;">                
                <div id="chart_div"></div>
                <div style="border: medium; width: 400px; height: 400px; overflow: scroll;">
                    <h5>Detalles :</h5>
                    <asp:GridView runat="server" class="table" ID="panelReportes" AutoGenerateColumns="false">
                        <Columns>
                            <asp:BoundField HeaderText="Producto" DataField="Producto" />
                            <asp:BoundField HeaderText="Cantidad" DataField="Cantidad" />
                            <asp:BoundField HeaderText="Fecha" DataField="Fecha" />
                        </Columns>
                    </asp:GridView>
                </div>
            </div>

        </ContentTemplate>
    </asp:UpdatePanel>



</asp:Content>
