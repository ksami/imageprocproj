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
            matlab.StartInfo.Arguments = "-nosplash -nodesktop –nojvm –noFigureWindows -minimize -wait -r " + textBox1.Text;
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

        private void radioMale_CheckedChanged(object sender, EventArgs e)
        {
            if (radioMale.Checked == true)
            {
                textBox7.Text = "face_m.jpg";
                textBox1.Text = "main('m')";
                textBox3.Text = "data/head_m_1.fbx";
                textBox4.Text = "data/head_m_2.fbx";
                textBox5.Text = "data/head_m_3.fbx";
            }
        }

        private void radioFemale_CheckedChanged(object sender, EventArgs e)
        {
            if (radioFemale.Checked == true)
            {
                textBox7.Text = "face_f.jpg";
                textBox1.Text = "main('f')";
                textBox3.Text = "data/head_f_1.fbx";
                textBox4.Text = "data/head_f_2.fbx";
                textBox5.Text = "data/head_f_3.fbx";
            }
        }
    }
}
