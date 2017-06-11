<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.master" AutoEventWireup="true" CodeFile="ChartView.aspx.cs" Inherits="ChartView" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


    <!--Doughnut chart-->
    <asp:Chart ID="Chart1" runat="server" Width="350px">
        <Titles><asp:Title Text="Total Marks of student"></asp:Title></Titles>

        <Series>
            <asp:Series Name="Series1" ChartType="Doughnut" YValuesPerPoint="4">
                <Points>
                    <asp:DataPoint AxisLabel="Ayush" YValues="800" />
                    <asp:DataPoint AxisLabel="kishor" YValues="600" />
                    <asp:DataPoint AxisLabel="nirdesh" YValues="700" />
                    <asp:DataPoint AxisLabel="samrat" YValues="1000" />

                </Points>



            </asp:Series>
        </Series>
        <ChartAreas>
            <asp:ChartArea Name="ChartArea1">
                <AxisX Title="Student Name"></AxisX>
                <AxisY Title="Total Marks"></AxisY>
            </asp:ChartArea>
        </ChartAreas>
    </asp:Chart>




    <!--chartType Pie chart-->
    <asp:Chart ID="Chart2" runat="server">
          <Titles><asp:Title Text="Total Marks of student"></asp:Title></Titles>
        <Series>
            <asp:Series ChartType="Pie" Name="Series1">
                  <Points>
                    <asp:DataPoint AxisLabel="Ayush" YValues="800" />
                    <asp:DataPoint AxisLabel="kishor" YValues="600" />
                    <asp:DataPoint AxisLabel="nirdesh" YValues="700" />
                    <asp:DataPoint AxisLabel="samrat" YValues="1000" />

                </Points>
            </asp:Series>
        </Series>
        <ChartAreas>
            <asp:ChartArea Name="ChartArea1">
                <AxisX Title="Student Name"></AxisX>
                <AxisY Title="Total Marks"></AxisY>
            </asp:ChartArea>
        </ChartAreas>
    </asp:Chart>
     <!--chartType Pie chart-->
    <asp:Chart ID="Chart3" runat="server">
        <Titles><asp:Title Text="Total Marks of student"></asp:Title></Titles>
        <Series>
            <asp:Series Name="Series1">
                   <Points>
                    <asp:DataPoint AxisLabel="Ayush" YValues="800" />
                    <asp:DataPoint AxisLabel="kishor" YValues="600" />
                    <asp:DataPoint AxisLabel="nirdesh" YValues="700" />
                    <asp:DataPoint AxisLabel="samrat" YValues="1000" />

                </Points>
            </asp:Series>
        </Series>
        <ChartAreas>
            <asp:ChartArea Name="ChartArea1">
                <AxisX Title="Student Name"></AxisX>
                <AxisY Title="Total Marks"></AxisY>
            </asp:ChartArea>
        </ChartAreas>
    </asp:Chart>




     <!--chartType Area chart-->
    <asp:Chart ID="Chart4" runat="server">
        <Titles><asp:Title Text="Total Marks of student"></asp:Title></Titles>
        <Series>
            <asp:Series ChartType="Area" Name="Series1">
                  <Points>
                    <asp:DataPoint AxisLabel="Ayush" YValues="800" />
                    <asp:DataPoint AxisLabel="kishor" YValues="600" />
                    <asp:DataPoint AxisLabel="nirdesh" YValues="700" />
                    <asp:DataPoint AxisLabel="samrat" YValues="1000" />

                </Points>
            </asp:Series>
        </Series>
        <ChartAreas>
            <asp:ChartArea Name="ChartArea1">
                 <AxisX Title="Student Name"></AxisX>
                <AxisY Title="Total Marks"></AxisY>
            </asp:ChartArea>
        </ChartAreas>
    </asp:Chart>
     <!--chartType Line chart-->
    <asp:Chart ID="Chart5" runat="server">
        <Titles><asp:Title Text="Total Marks of student"></asp:Title></Titles>
        <Series>
            <asp:Series ChartType="Line" Name="Series1">
                  <Points>
                    <asp:DataPoint AxisLabel="Ayush" YValues="800" />
                    <asp:DataPoint AxisLabel="kishor" YValues="600" />
                    <asp:DataPoint AxisLabel="nirdesh" YValues="700" />
                    <asp:DataPoint AxisLabel="samrat" YValues="1000" />

                </Points>
            </asp:Series>
        </Series>
        <ChartAreas>
            <asp:ChartArea Name="ChartArea1">
                <AxisX Title="Student Name"></AxisX>
                <AxisY Title="Total Marks"></AxisY>
            </asp:ChartArea>
        </ChartAreas>
    </asp:Chart>
     <!--chartType Bubble chart-->
    <asp:Chart ID="Chart6" runat="server">
        <Titles><asp:Title Text="Total Marks of student"></asp:Title></Titles>
        <Series>
            <asp:Series ChartType="Bubble" Name="Series1" YValuesPerPoint="2">
                  <Points>
                    <asp:DataPoint AxisLabel="Ayush" YValues="800" />
                    <asp:DataPoint AxisLabel="kishor" YValues="600" />
                    <asp:DataPoint AxisLabel="nirdesh" YValues="700" />
                    <asp:DataPoint AxisLabel="samrat" YValues="1000" />

                </Points>
            </asp:Series>
        </Series>
        <ChartAreas>
            <asp:ChartArea Name="ChartArea1">
                  <AxisX Title="Student Name"></AxisX>
                <AxisY Title="Total Marks"></AxisY>
            </asp:ChartArea>
        </ChartAreas>
    </asp:Chart>
    <br />
    <br />
    <br />





</asp:Content>

