using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Diagnostics;

namespace headui
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            Process matlab = new Process();
            matlab.StartInfo.FileName = "matlab";
            matlab.StartInfo.Arguments = "-nosplash -nodesktop –nojvm –noFigureWindows -minimize -wait -r run('" + textBox1.Text + "')";
            matlab.Start();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            Process viewer = new Process();
            viewer.StartInfo.FileName = textBox2.Text;
            viewer.StartInfo.Arguments = textBox3.Text;
            //viewer.StartInfo.Arguments = "../../../../data/head_m_1.fbx";
            viewer.Start();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            Process viewer = new Process();
            viewer.StartInfo.FileName = textBox2.Text;
            viewer.StartInfo.Arguments = textBox4.Text;
            //viewer.StartInfo.Arguments = "../../../../data/head_m_2.fbx";
            viewer.Start();
        }

        private void button4_Click(object sender, EventArgs e)
        {
            Process viewer = new Process();
            viewer.StartInfo.FileName = textBox2.Text;
            viewer.StartInfo.Arguments = textBox5.Text;
            //viewer.StartInfo.Arguments = "../../../../data/head_m_3.fbx";
            viewer.Start();
        }
    }
}
