<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Reportes.aspx.cs" Inherits="WebApplication.Reportes" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div style="max-width: 1200px; margin: 0 auto; padding: 20px;">
        <div style="border-radius: 8px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); text-align: center; background-color: #fff; margin-bottom: 20px; border: 1px solid #dee2e6;">
            <div style="background-color: #007bff; padding: 10px; border-top-left-radius: 8px; border-top-right-radius: 8px; color: white;">
                <h2 style="margin: 0; color: white;">Reporte de ventas</h2>
            </div>
            <div style="padding: 20px;">
                <asp:Button Text="Volver" CssClass="btn btn-primary" runat="server" ID="Inicio" OnClick="Inicio_Click"
                    Style="background-color: #007bff; border-color: #007bff; color: #fff; border-radius: 4px; padding: 10px 20px; font-size: 16px; cursor: pointer;" />
            </div>
            <div style="background-color: #f8f9fa; padding: 10px; border-bottom-left-radius: 8px; border-bottom-right-radius: 8px;">
            </div>
        </div>
    </div>

    <div style="display: flex; align-items: center; margin-bottom: 20px;">
        <label for="barraAño" style="font-size: 18px; margin-right: 10px;">Buscar año:</label>
        <asp:DropDownList ID="barraAño" runat="server" CssClass="form-control"
            Style="width: 120px; padding: 10px; border-radius: 4px; border: 1px solid #ced4da;"
            AutoPostBack="true" OnSelectedIndexChanged="barraAño_SelectedIndexChanged">
        </asp:DropDownList>
    </div>

    <asp:ScriptManager runat="server" />
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <script  type="text/javascript">
                google.charts.load('current', { 'packages': ['corechart'] });
                google.charts.setOnLoadCallback(drawChart);

                function drawChart() {
                    var data = new google.visualization.DataTable();
                    data.addColumn('string', 'Topping');
                    data.addColumn('number', 'Mes');
                    data.addRows(<%= ObtenerDatos() %>);

                    var options = {
                        title: 'Reporte de ventas',
                        width: '100%',
                        height: 400,
                        legend: { position: 'none' },
                        chartArea: { width: '80%' }
                    };

                    var chart = new google.visualization.ColumnChart(document.getElementById('chart_div'));
                    chart.draw(data, options);
                }
            </script>

            <div style="border: 1px solid #ddd; border-radius: 8px; background-color: #fff; padding: 20px;">
                <div id="chart_div" style="width: 100%; height: 400px; margin-bottom: 20px;overflow:auto"></div>
                <div style="overflow: scroll; height: 340px">
                    <h5 style="margin-top: 0;">Detalles:</h5>
                    <asp:GridView runat="server" class="table" ID="panelReportes" AutoGenerateColumns="false"
                        Style="width: 100%; border-collapse: collapse; margin: 0; border: 1px solid #ddd;">
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
