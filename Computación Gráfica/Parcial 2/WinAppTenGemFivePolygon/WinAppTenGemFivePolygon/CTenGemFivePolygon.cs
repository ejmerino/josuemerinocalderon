using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Drawing;
using System.Windows.Forms;

namespace WinAppTenGemFivePolygon
{
    class CTenGemFivePolygon
    {
        // Datos Miembro (Atributos).

        // Lado del decágono.
        private float side;
        // Segmentos del decágono.
        private float a, b, c, d;
        // Ángulos del decágono.
        private float angle1, angle2;
        // Objeto que activa el modo gráfico.
        private Graphics graph;
        SolidBrush whiteBrush;
        // Objeto bolígrafo para dibujar en un lienzo.
        private Pen pen;
        // Constante scale factor (Zoom In/Zoom Out).
        public float SF;
        // Objeto Punto que representa a los diez vértices del decágono interior.
        private PointF A, B, C, D, E, F, G, H, I, J, O;
        // Objeto Punto que representa a los diez vértices del decágono interior.
        private PointF A2, B2, C2, D2, E2, F2, G2, H2, I2, J2;
        // Objeto Punto que representa a los vértices de pentagono interior.
        private PointF K, M, N, P, Q, R, S, T, U, V;
        // Objeto Punto que representa a los vértices al interior de la estrella mayor.
        private PointF A1, B1, C1, D1, E1;
        private PointF Ks, Ms, Ns, Ps, Qs, Rs, Ss, Ts, Us, Vs;
        private PointF Ki, Mi, Ni, Pi, Qi, Ri, Si, Ti, Ui, Vi;
        // Objeto Punto que representa a los vértices las linas interiores.
        private PointF P1, P2, P3, P4, P5, P6, P7, P8, P9, P10;
        private PointF P11, P12, P13, P14, P15, P16, P17, P18, P19, P20;
        private PointF P21, P22, P23, P24, P25;

        public CTenGemFivePolygon()
        {
            side = 0.0f;
        }

        // Función que lee el lado del decágono.
        public void ReadData(TextBox txtSideSide)
        {
            try
            {
                side = float.Parse(txtSideSide.Text);
            }
            catch
            {
                MessageBox.Show("Ingreso no válido...");
            }
        }

        // Función que inicializa los datos y controles de la figura.
        public void InitializeData(TextBox txtSide,
                                   PictureBox picCanvas,
                                   TrackBar trackBar1)
        {
            side = 0.0f; picCanvas.Refresh();
        }

        // Función que calcula los valores de los diez vértices del decágono interior.
        private void CalculateVertexInterDecagon()
        {
            angle1 = 18.0f * (float)Math.PI / 180.0f;
            angle2 = 36.0f * (float)Math.PI / 180.0f;
            a = side * (float)Math.Sin(angle2);
            b = side * (float)Math.Cos(angle1);
            c = side * (float)Math.Sin(angle1);
            d = side * (float)Math.Cos(angle2);
            A.X = a + b; A.Y = 0;
            B.X = a + 2 * b; B.Y = c;
            C.X = 2 * a + 2 * b; C.Y = c + d;
            D.X = 2 * a + 2 * b; D.Y = c + d + side;
            E.X = a + 2 * b; E.Y = c + 2 * d + side;
            F.X = a + b; F.Y = 2 * c + 2 * d + side;
            G.X = a; G.Y = c + 2 * d + side;
            H.X = 0; H.Y = c + d + side;
            I.X = 0; I.Y = c + d;
            J.X = a; J.Y = c;
            Ps.X = a + 2 * b; Ps.Y = c + d + side + (d / 2.0f);
            Ss.X = a; Ss.Y = c + d + side + (d / 2.0f);
            O.X = a + b; O.Y = c + d + (side / 2.0f);
        }

        // Función que calcula el punto de intersección entre dos rectas utilizando el Teorema 1.
        private PointF CalculateIntersectionPoint(PointF P1, PointF P2, PointF P3, PointF P4)
        {
            PointF P = new PointF();
            float m1 = (P2.Y - P1.Y) / (P2.X - P1.X);
            float m2 = (P4.Y - P3.Y) / (P4.X - P3.X);

            if ((m1 - m2) != 0)
            {
                P.X = (P3.Y - P1.Y + m1 * P1.X - m2 * P3.X) / (m1 - m2);
                P.Y = P1.Y + m1 * (P.X - P1.X);
            }
            return (P);
        }

            // Función que calcula los valores de los vértices del pentagono interior.
            private void CalculateVertexPentagon()
        {
            K = CalculateIntersectionPoint(A, C, B, J);
            M = CalculateIntersectionPoint(B, D, A, C);
            N = CalculateIntersectionPoint(B, D, C, E);
            P = CalculateIntersectionPoint(C, E, D, F);
            Q = CalculateIntersectionPoint(D, F, E, G);
            R = CalculateIntersectionPoint(F, H, E, G);
            S = CalculateIntersectionPoint(G, I, F, H);
            T = CalculateIntersectionPoint(H, J, G, I);
            U = CalculateIntersectionPoint(H, J, A, I);
            V = CalculateIntersectionPoint(B, J, A, I);
            Ks = CalculateIntersectionPoint(A, D, B, J);
            Ms = CalculateIntersectionPoint(B, D, C, J);
            Ns = CalculateIntersectionPoint(B, D, C, F);
            Qs = CalculateIntersectionPoint(D, F, E, H);
            Rs = CalculateIntersectionPoint(F, H, D, G);
            Ts = CalculateIntersectionPoint(H, J, F, I);
            Us = CalculateIntersectionPoint(H, J, B, I);
            Vs = CalculateIntersectionPoint(B, J, A, H);
        }

        // Función que calcula los valores de los vértices de la estrella interior mayor.
        private void CalculateVertexInteriorStarM()
        {
            A1 = CalculateIntersectionPoint(N, V, K, T);
            B1 = CalculateIntersectionPoint(N, V, M, Q);
            C1 = CalculateIntersectionPoint(M, Q, P, S);
            D1 = CalculateIntersectionPoint(R, U, P, S);
            E1 = CalculateIntersectionPoint(K, T, R, U);
        }

        private void CalculateVertexInteriorStarI()
        {
            Ki = CalculateIntersectionPoint(K, A1, Ks, O);
            Mi = CalculateIntersectionPoint(M, B1, Ms, O);
            Ni = CalculateIntersectionPoint(N, B1, Ns, O);
            Pi = CalculateIntersectionPoint(P, C1, Ps, O);
            Qi = CalculateIntersectionPoint(Q, C1, Qs, O);
            Ri = CalculateIntersectionPoint(R, D1, Rs, O);
            Si = CalculateIntersectionPoint(S, D1, Ss, O);
            Ti = CalculateIntersectionPoint(T, E1, Ts, O);
            Ui = CalculateIntersectionPoint(U, E1, Us, O);
            Vi = CalculateIntersectionPoint(V, A1, Vs, O);
        }


        //Función que calcula los valores de los vértices de las lineas interiores.
        private void CalculateVertexInteriorLines()
        {
            P1 = CalculateIntersectionPoint(B, I, K, O);
            P2 = CalculateIntersectionPoint(C, J, M, O);
            P3 = CalculateIntersectionPoint(A, D, N, O);
            P4 = CalculateIntersectionPoint(D, G, P, O);
            P5 = CalculateIntersectionPoint(C, F, Q, O);
            P6 = CalculateIntersectionPoint(F, I, R, O);
            P7 = CalculateIntersectionPoint(E, H, S, O);
            P8 = CalculateIntersectionPoint(A, H, T, O);
            P9 = CalculateIntersectionPoint(B, I, U, O);
            P10 = CalculateIntersectionPoint(C, J, V, O);
            P11 = CalculateIntersectionPoint(B, H, K, O);
            P12 = CalculateIntersectionPoint(B, F, M, O);
            P13 = CalculateIntersectionPoint(D, J, N, O);
            P14 = CalculateIntersectionPoint(D, H, P, O);
            P15 = CalculateIntersectionPoint(B, F, Q, O);
            P16 = CalculateIntersectionPoint(F, J, R, O);
            P17 = CalculateIntersectionPoint(D, H, S, O);
            P18 = CalculateIntersectionPoint(B, H, T, O);
            P19 = CalculateIntersectionPoint(K, T, U, O);
            P20 = CalculateIntersectionPoint(D, J, V, O);

            P21 = CalculateIntersectionPoint(A, E, B, O);
            P22 = CalculateIntersectionPoint(C, G, D, O);
            P23 = CalculateIntersectionPoint(E, I, C, G);
            P24 = CalculateIntersectionPoint(A, G, H, O);
            P25 = CalculateIntersectionPoint(C, I, J, O);
        }

        
        // Función que grafica las estrellas poligonales de 10 puntas de color azul obscuro (DarkBlue), y
        // un decagono regular grande de color negro (Black).
        public void PlotFigures(PictureBox picCanvas, float rotationAngle, float translateX, float translateY)
        {
            ApplyTranslation(translateX,translateY);

            graph = picCanvas.CreateGraphics();

            CalculateVertexInterDecagon();
            CalculateVertexPentagon();
            CalculateVertexInteriorStarM();
            CalculateVertexInteriorStarI();
            CalculateVertexInteriorLines();


            A.X = A.X * SF + 170.0f; A.Y = (-1) * A.Y * SF + 345.0f;
            B.X = B.X * SF + 170.0f; B.Y = (-1) * B.Y * SF + 345.0f;
            C.X = C.X * SF + 170.0f; C.Y = (-1) * C.Y * SF + 345.0f;
            D.X = D.X * SF + 170.0f; D.Y = (-1) * D.Y * SF + 345.0f;
            E.X = E.X * SF + 170.0f; E.Y = (-1) * E.Y * SF + 345.0f;
            F.X = F.X * SF + 170.0f; F.Y = (-1) * F.Y * SF + 345.0f;
            G.X = G.X * SF + 170.0f; G.Y = (-1) * G.Y * SF + 345.0f;
            H.X = H.X * SF + 170.0f; H.Y = (-1) * H.Y * SF + 345.0f;
            I.X = I.X * SF + 170.0f; I.Y = (-1) * I.Y * SF + 345.0f;
            J.X = J.X * SF + 170.0f; J.Y = (-1) * J.Y * SF + 345.0f;
            O.X = O.X * SF + 170.0f; O.Y = (-1) * O.Y * SF + 345.0f;
            A2.X = A.X; A2.Y = (A.Y + 10.0f);
            B2.X = (B.X + 8.0f); B2.Y = (B.Y + 8.0f);
            C2.X = (C.X + 10.0f); C2.Y = C.Y;
            D2.X = (D.X + 10.0f); D2.Y = D.Y;
            E2.X = (E.X + 8.0f); E2.Y = (E.Y - 8.0f);
            F2.X = F.X; F2.Y = (F.Y - 10.0f);
            G2.X = (G.X - 8.0f); G2.Y = (G.Y - 8.0f);
            H2.X = (H.X - 10.0f); H2.Y = H.Y;
            I2.X = (I.X - 10.0f); I2.Y = I.Y;
            J2.X = (J.X - 8.0f); J2.Y = (J.Y + 8.0f);
            A1.X = A1.X * SF + 170.0f; A1.Y = (-1) * A1.Y * SF + 345.0f;
            B1.X = B1.X * SF + 170.0f; B1.Y = (-1) * B1.Y * SF + 345.0f;
            C1.X = C1.X * SF + 170.0f; C1.Y = (-1) * C1.Y * SF + 345.0f;
            D1.X = D1.X * SF + 170.0f; D1.Y = (-1) * D1.Y * SF + 345.0f;
            E1.X = E1.X * SF + 170.0f; E1.Y = (-1) * E1.Y * SF + 345.0f;
            K.X = K.X * SF + 170.0f; K.Y = (-1) * K.Y * SF + 345.0f;
            M.X = M.X * SF + 170.0f; M.Y = (-1) * M.Y * SF + 345.0f;
            N.X = N.X * SF + 170.0f; N.Y = (-1) * N.Y * SF + 345.0f;
            P.X = P.X * SF + 170.0f; P.Y = (-1) * P.Y * SF + 345.0f;
            Q.X = Q.X * SF + 170.0f; Q.Y = (-1) * Q.Y * SF + 345.0f;
            R.X = R.X * SF + 170.0f; R.Y = (-1) * R.Y * SF + 345.0f;
            S.X = S.X * SF + 170.0f; S.Y = (-1) * S.Y * SF + 345.0f;
            T.X = T.X * SF + 170.0f; T.Y = (-1) * T.Y * SF + 345.0f;
            U.X = U.X * SF + 170.0f; U.Y = (-1) * U.Y * SF + 345.0f;
            V.X = V.X * SF + 170.0f; V.Y = (-1) * V.Y * SF + 345.0f;        
            Ks.X = Ks.X * SF + 170.0f; Ks.Y = (-1) * Ks.Y * SF + 345.0f;
            Ms.X = Ms.X * SF + 170.0f; Ms.Y = (-1) * Ms.Y * SF + 345.0f;
            Ns.X = Ns.X * SF + 170.0f; Ns.Y = (-1) * Ns.Y * SF + 345.0f;
            Ps.X = Ps.X * SF + 170.0f; Ps.Y = (-1) * Ps.Y * SF + 345.0f;
            Qs.X = Qs.X * SF + 170.0f; Qs.Y = (-1) * Qs.Y * SF + 345.0f;
            Rs.X = Rs.X * SF + 170.0f; Rs.Y = (-1) * Rs.Y * SF + 345.0f;
            Ss.X = Ss.X * SF + 170.0f; Ss.Y = (-1) * Ss.Y * SF + 345.0f;
            Ts.X = Ts.X * SF + 170.0f; Ts.Y = (-1) * Ts.Y * SF + 345.0f;
            Us.X = Us.X * SF + 170.0f; Us.Y = (-1) * Us.Y * SF + 345.0f;
            Vs.X = Vs.X * SF + 170.0f; Vs.Y = (-1) * Vs.Y * SF + 345.0f;
            Ki.X = Ki.X * SF + 170.0f; Ki.Y = (-1) * Ki.Y * SF + 345.0f;
            Mi.X = Mi.X * SF + 170.0f; Mi.Y = (-1) * Mi.Y * SF + 345.0f;
            Ni.X = Ni.X * SF + 170.0f; Ni.Y = (-1) * Ni.Y * SF + 345.0f;
            Pi.X = Pi.X * SF + 170.0f; Pi.Y = (-1) * Pi.Y * SF + 345.0f;
            Qi.X = Qi.X * SF + 170.0f; Qi.Y = (-1) * Qi.Y * SF + 345.0f;
            Ri.X = Ri.X * SF + 170.0f; Ri.Y = (-1) * Ri.Y * SF + 345.0f;
            Si.X = Si.X * SF + 170.0f; Si.Y = (-1) * Si.Y * SF + 345.0f;
            Ti.X = Ti.X * SF + 170.0f; Ti.Y = (-1) * Ti.Y * SF + 345.0f;
            Ui.X = Ui.X * SF + 170.0f; Ui.Y = (-1) * Ui.Y * SF + 345.0f;
            Vi.X = Vi.X * SF + 170.0f; Vi.Y = (-1) * Vi.Y * SF + 345.0f;
            P1.X = P1.X * SF + 170.0f; P1.Y = (-1) * P1.Y * SF + 345.0f;
            P2.X = P2.X * SF + 170.0f; P2.Y = (-1) * P2.Y * SF + 345.0f;
            P3.X = P3.X * SF + 170.0f; P3.Y = (-1) * P3.Y * SF + 345.0f;
            P4.X = P4.X * SF + 170.0f; P4.Y = (-1) * P4.Y * SF + 345.0f;
            P5.X = P5.X * SF + 170.0f; P5.Y = (-1) * P5.Y * SF + 345.0f;
            P6.X = P6.X * SF + 170.0f; P6.Y = (-1) * P6.Y * SF + 345.0f;
            P7.X = P7.X * SF + 170.0f; P7.Y = (-1) * P7.Y * SF + 345.0f;
            P8.X = P8.X * SF + 170.0f; P8.Y = (-1) * P8.Y * SF + 345.0f;
            P9.X = P9.X * SF + 170.0f; P9.Y = (-1) * P9.Y * SF + 345.0f;
            P10.X = P10.X * SF + 170.0f; P10.Y = (-1) * P10.Y * SF + 345.0f;
            P11.X = P11.X * SF + 170.0f; P11.Y = (-1) * P11.Y * SF + 345.0f;
            P12.X = P12.X * SF + 170.0f; P12.Y = (-1) * P12.Y * SF + 345.0f;
            P13.X = P13.X * SF + 170.0f; P13.Y = (-1) * P13.Y * SF + 345.0f;
            P14.X = P14.X * SF + 170.0f; P14.Y = (-1) * P14.Y * SF + 345.0f;
            P15.X = P15.X * SF + 170.0f; P15.Y = (-1) * P15.Y * SF + 345.0f;
            P16.X = P16.X * SF + 170.0f; P16.Y = (-1) * P16.Y * SF + 345.0f;
            P17.X = P17.X * SF + 170.0f; P17.Y = (-1) * P17.Y * SF + 345.0f;
            P18.X = P18.X * SF + 170.0f; P18.Y = (-1) * P18.Y * SF + 345.0f;
            P19.X = P19.X * SF + 170.0f; P19.Y = (-1) * P19.Y * SF + 345.0f;
            P20.X = P20.X * SF + 170.0f; P20.Y = (-1) * P20.Y * SF + 345.0f;
            P21.X = P21.X * SF + 170.0f; P21.Y = (-1) * P21.Y * SF + 345.0f;
            P22.X = P22.X * SF + 170.0f; P22.Y = (-1) * P22.Y * SF + 345.0f;
            P23.X = P23.X * SF + 170.0f; P23.Y = (-1) * P23.Y * SF + 345.0f;
            P24.X = P24.X * SF + 170.0f; P24.Y = (-1) * P24.Y * SF + 345.0f;
            P25.X = P25.X * SF + 170.0f; P25.Y = (-1) * P25.Y * SF + 345.0f;

             // Aplica la rotación a cada punto
            A = RotatePoint(A, rotationAngle);
            B = RotatePoint(B, rotationAngle);
            C = RotatePoint(C, rotationAngle);
            D = RotatePoint(D, rotationAngle);
            E = RotatePoint(E, rotationAngle);
            F = RotatePoint(F, rotationAngle);
            G = RotatePoint(G, rotationAngle);
            H = RotatePoint(H, rotationAngle);
            I = RotatePoint(I, rotationAngle);
            J = RotatePoint(J, rotationAngle);
            O = RotatePoint(O, rotationAngle);
            A2 = RotatePoint(A2, rotationAngle);
            B2 = RotatePoint(B2, rotationAngle);
            C2 = RotatePoint(C2, rotationAngle);
            D2 = RotatePoint(D2, rotationAngle);
            E2 = RotatePoint(E2, rotationAngle);
            F2 = RotatePoint(F2, rotationAngle);
            G2 = RotatePoint(G2, rotationAngle);
            H2 = RotatePoint(H2, rotationAngle);
            I2 = RotatePoint(I2, rotationAngle);
            J2 = RotatePoint(J2, rotationAngle);
            A1 = RotatePoint(A1, rotationAngle);
            B1 = RotatePoint(B1, rotationAngle);
            C1 = RotatePoint(C1, rotationAngle);
            D1 = RotatePoint(D1, rotationAngle);
            E1 = RotatePoint(E1, rotationAngle);
            K = RotatePoint(K, rotationAngle);
            M = RotatePoint(M, rotationAngle);
            N = RotatePoint(N, rotationAngle);
            P = RotatePoint(P, rotationAngle);
            Q = RotatePoint(Q, rotationAngle);
            R = RotatePoint(R, rotationAngle);
            S = RotatePoint(S, rotationAngle);
            T = RotatePoint(T, rotationAngle);
            U = RotatePoint(U, rotationAngle);
            V = RotatePoint(V, rotationAngle);
            Ks = RotatePoint(Ks, rotationAngle);
            Ms = RotatePoint(Ms, rotationAngle);
            Ns = RotatePoint(Ns, rotationAngle);
            Ps = RotatePoint(Ps, rotationAngle);
            Qs = RotatePoint(Qs, rotationAngle);
            Rs = RotatePoint(Rs, rotationAngle);
            Ss = RotatePoint(Ss, rotationAngle);
            Ts = RotatePoint(Ts, rotationAngle);
            Us = RotatePoint(Us, rotationAngle);
            Vs = RotatePoint(Vs, rotationAngle);
            Ki = RotatePoint(Ki, rotationAngle);
            Mi = RotatePoint(Mi, rotationAngle);
            Ni = RotatePoint(Ni, rotationAngle);
            Pi = RotatePoint(Pi, rotationAngle);
            Qi = RotatePoint(Qi, rotationAngle);
            Ri = RotatePoint(Ri, rotationAngle);
            Si = RotatePoint(Si, rotationAngle);
            Ti = RotatePoint(Ti, rotationAngle);
            Ui = RotatePoint(Ui, rotationAngle);
            Vi = RotatePoint(Vi, rotationAngle);
            P1 = RotatePoint(P1, rotationAngle);
            P2 = RotatePoint(P2, rotationAngle);
            P3 = RotatePoint(P3, rotationAngle);
            P4 = RotatePoint(P4, rotationAngle);
            P5 = RotatePoint(P5, rotationAngle);
            P6 = RotatePoint(P6, rotationAngle);
            P7 = RotatePoint(P7, rotationAngle);
            P8 = RotatePoint(P8, rotationAngle);
            P9 = RotatePoint(P9, rotationAngle);
            P10 = RotatePoint(P10, rotationAngle);
            P11 = RotatePoint(P11, rotationAngle);
            P12 = RotatePoint(P12, rotationAngle);
            P13 = RotatePoint(P13, rotationAngle);
            P14 = RotatePoint(P14, rotationAngle);
            P15 = RotatePoint(P15, rotationAngle);
            P16 = RotatePoint(P16, rotationAngle);
            P17 = RotatePoint(P17, rotationAngle);
            P18 = RotatePoint(P18, rotationAngle);
            P19 = RotatePoint(P19, rotationAngle);
            P20 = RotatePoint(P20, rotationAngle);
            P21 = RotatePoint(P21, rotationAngle);
            P22 = RotatePoint(P22, rotationAngle);
            P23 = RotatePoint(P23, rotationAngle);
            P24 = RotatePoint(P24, rotationAngle);
            P25 = RotatePoint(P25, rotationAngle);            
            pen = new Pen(Color.Black);
            PointF[] polBigDecagon = { A2, B2, C2, D2, E2, F2, G2, H2, I2, J2, A2 };
            graph.DrawPolygon(pen, polBigDecagon);
            graph.DrawLine(pen, A, A2);
            graph.DrawLine(pen, B, B2);
            graph.DrawLine(pen, C, C2);
            graph.DrawLine(pen, D, D2);
            graph.DrawLine(pen, E, E2);
            graph.DrawLine(pen, F, F2);
            graph.DrawLine(pen, G, G2);
            graph.DrawLine(pen, H, H2);
            graph.DrawLine(pen, I, I2);
            graph.DrawLine(pen, J, J2);

            // Se grafica la estrella interior mas grande
            pen = new Pen(Color.DarkBlue);
            PointF[] polInterStarM1 = { A, K, A1, V, A };
            graph.DrawPolygon(pen, polInterStarM1);
            graph.DrawLine(pen, A1, O);
            graph.DrawLine(pen, A1, Ks);
            graph.DrawLine(pen, A1, Vs);
            PointF[] polInterStarM2 = { C, N, B1, M, C };
            graph.DrawPolygon(pen, polInterStarM2);
            graph.DrawLine(pen, B1, O);
            graph.DrawLine(pen, B1, Ms);
            graph.DrawLine(pen, B1, Ns);
            PointF[] polInterStarM3 = { E, Q, C1, P, E };
            graph.DrawPolygon(pen, polInterStarM3);
            graph.DrawLine(pen, C1, O);
            graph.DrawLine(pen, C1, Ps);
            graph.DrawLine(pen, C1, Qs);
            PointF[] polInterStarM4 = { G, S, D1, R, G };
            graph.DrawPolygon(pen, polInterStarM4);
            graph.DrawLine(pen, D1, O);
            graph.DrawLine(pen, D1, Rs);
            graph.DrawLine(pen, D1, Ss);
            PointF[] polInterStarM5 = { I, U, E1, T, I };
            graph.DrawPolygon(pen, polInterStarM5);
            graph.DrawLine(pen, E1, O);
            graph.DrawLine(pen, E1, Ts);
            graph.DrawLine(pen, E1, Us);
            PointF[] polInterStarM6 = { A, B, Ks, A };
            graph.DrawPolygon(pen, polInterStarM6);
            PointF[] polInterStarM7 = { B, C, Ms, B };
            graph.DrawPolygon(pen, polInterStarM7);
            PointF[] polInterStarM8 = { C, D, Ns, C };
            graph.DrawPolygon(pen, polInterStarM8);
            PointF[] polInterStarM9 = { D, E, Ps, D };
            graph.DrawPolygon(pen, polInterStarM9);
            PointF[] polInterStarM10 = { E, F, Qs, E };
            graph.DrawPolygon(pen, polInterStarM10);
            PointF[] polInterStarM11 = { F, G, Rs, F };
            graph.DrawPolygon(pen, polInterStarM11);
            PointF[] polInterStarM12 = { G, H, Ss, G };
            graph.DrawPolygon(pen, polInterStarM12);
            PointF[] polInterStarM13 = { H, I, Ts, H };
            graph.DrawPolygon(pen, polInterStarM13);
            PointF[] polInterStarM14 = { I, J, Us, I };
            graph.DrawPolygon(pen, polInterStarM14);
            PointF[] polInterStarM15 = { J, A, Vs, J };
            graph.DrawPolygon(pen, polInterStarM15);
            PointF[] polInterStarM16 = { K, O, Ki, K };
            graph.DrawPolygon(pen, polInterStarM16);
            PointF[] polInterStarM17 = { M, O, Mi, M };
            graph.DrawPolygon(pen, polInterStarM17);
            PointF[] polInterStarM18 = { N, O, Ni, N };
            graph.DrawPolygon(pen, polInterStarM18);
            PointF[] polInterStarM19 = { P, O, Pi, P };
            graph.DrawPolygon(pen, polInterStarM19);
            PointF[] polInterStarM20 = { Q, O, Qi, Q };
            graph.DrawPolygon(pen, polInterStarM20);
            PointF[] polInterStarM21 = { R, O, Ri, R };
            graph.DrawPolygon(pen, polInterStarM21);
            PointF[] polInterStarM22 = { S, O, Si, S };
            graph.DrawPolygon(pen, polInterStarM22);
            PointF[] polInterStarM23 = { T, O, Ti, T };
            graph.DrawPolygon(pen, polInterStarM23);
            PointF[] polInterStarM24 = { U, O, Ui, U };
            graph.DrawPolygon(pen, polInterStarM24);
            PointF[] polInterStarM25 = { V, O, Vi, V };
            graph.DrawPolygon(pen, polInterStarM25);
            graph.DrawLine(pen, P21, O);
            graph.DrawLine(pen, P22, O);
            graph.DrawLine(pen, P23, O);
            graph.DrawLine(pen, P24, O);
            graph.DrawLine(pen, P25, O);

            // Se grafica el circulo central de la figura.
            whiteBrush = new SolidBrush(Color.White);
            graph.FillEllipse(whiteBrush, O.X - (1 * SF), O.Y - (1 * SF), 2 * SF, 2 * SF);
            graph.DrawEllipse(pen, O.X - (1 * SF), O.Y - (1 * SF), 2 * SF, 2 * SF);

            // Se grafica las lineas interiores
            pen = new Pen(Color.Red);
            graph.DrawLine(pen, B, P1);
            graph.DrawLine(pen, B, P2);
            PointF[] polInterLines1 = { B, P11, P21, P12, B };
            graph.DrawPolygon(pen, polInterLines1);
            graph.DrawLine(pen, D, P3);
            graph.DrawLine(pen, D, P4);
            PointF[] polInterLines2 = { D, P13, P22, P14, D };
            graph.DrawPolygon(pen, polInterLines2);
            graph.DrawLine(pen, F, P5);
            graph.DrawLine(pen, F, P6);
            PointF[] polInterLines3 = { F, P15, P23, P16, F };
            graph.DrawPolygon(pen, polInterLines3);
            graph.DrawLine(pen, H, P7);
            graph.DrawLine(pen, H, P8);
            PointF[] polInterLines4 = { H, P17, P24, P18, H };
            graph.DrawPolygon(pen, polInterLines4);
            graph.DrawLine(pen, J, P9);
            graph.DrawLine(pen, J, P10);
            PointF[] polInterLines5 = { J, P19, P25, P20, J };
            graph.DrawPolygon(pen, polInterLines5);
        }

        // Función que cierra un formulario.
        public void CloseForm(Form ObjForm)
        {
            ObjForm.Close();
        }

        //Funcion para la rotacion
        private PointF RotatePoint(PointF point, float angle)
        {
            float radians = angle * (float)Math.PI / 180.0f;
            float cosAngle = (float)Math.Cos(radians);
            float sinAngle = (float)Math.Sin(radians);

            float x = point.X * cosAngle - point.Y * sinAngle;
            float y = point.X * sinAngle + point.Y * cosAngle;

            return new PointF(x, y);
        }

        //Funcion para aplicar traslacion
        public void ApplyTranslation(float translateX, float translateY)
        {
            A = TranslatePoint(A,translateX,translateY);
            B = TranslatePoint(B,translateX, translateY);
            C = TranslatePoint(C, translateX, translateY);
            D = TranslatePoint(D, translateX, translateY);
            E = TranslatePoint(E, translateX, translateY);
            F = TranslatePoint(F, translateX, translateY);
            G = TranslatePoint(G, translateX, translateY);
            H = TranslatePoint(H, translateX, translateY);
            I = TranslatePoint(I, translateX, translateY);
            J = TranslatePoint(J, translateX, translateY);
            O = TranslatePoint(O, translateX, translateY);

            A2 = TranslatePoint(A2, translateX, translateY);
            B2 = TranslatePoint(B2, translateX, translateY);
            C2 = TranslatePoint(C2, translateX, translateY);
            D2 = TranslatePoint(D2, translateX, translateY);
            E2 = TranslatePoint(E2, translateX, translateY);
            F2 = TranslatePoint(F2, translateX, translateY);
            G2 = TranslatePoint(G2, translateX, translateY);
            H2 = TranslatePoint(H2, translateX, translateY);
            I2 = TranslatePoint(I2, translateX, translateY);
            J2 = TranslatePoint(J2, translateX, translateY);

            K = TranslatePoint(K, translateX, translateY);
            M = TranslatePoint(M, translateX, translateY);
            N = TranslatePoint(N, translateX, translateY);
            P = TranslatePoint(P, translateX, translateY);
            Q = TranslatePoint(Q, translateX, translateY);
            R = TranslatePoint(R, translateX, translateY);
            S = TranslatePoint(S, translateX, translateY);
            T = TranslatePoint(T, translateX, translateY);
            U = TranslatePoint(U, translateX, translateY);
            V = TranslatePoint(V, translateX, translateY);

            A1 = TranslatePoint(A1, translateX, translateY);
            B1 = TranslatePoint(B1, translateX, translateY);
            C1 = TranslatePoint(C1, translateX, translateY);
            D1 = TranslatePoint(D1, translateX, translateY);
            E1 = TranslatePoint(E1, translateX, translateY);

            Ks = TranslatePoint(Ks, translateX, translateY);
            Ms = TranslatePoint(Ms, translateX, translateY);
            Ns = TranslatePoint(Ns, translateX, translateY);
            Ps = TranslatePoint(Ps, translateX, translateY);
            Qs = TranslatePoint(Qs, translateX, translateY);
            Rs = TranslatePoint(Rs, translateX, translateY);
            Ss = TranslatePoint(Ss, translateX, translateY);
            Ts = TranslatePoint(Ts, translateX, translateY);
            Us = TranslatePoint(Us, translateX, translateY);
            Vs = TranslatePoint(Vs, translateX, translateY);

            Ki = TranslatePoint(Ki, translateX, translateY);
            Mi = TranslatePoint(Mi, translateX, translateY);
            Ni = TranslatePoint(Ni, translateX, translateY);
            Pi = TranslatePoint(Pi, translateX, translateY);
            Qi = TranslatePoint(Qi, translateX, translateY);
            Ri = TranslatePoint(Ri, translateX, translateY);
            Si = TranslatePoint(Si, translateX, translateY);
            Ti = TranslatePoint(Ti, translateX, translateY);
            Ui = TranslatePoint(Ui, translateX, translateY);
            Vi = TranslatePoint(Vi, translateX, translateY);

            P1 = TranslatePoint(P1, translateX, translateY);
            P2 = TranslatePoint(P2, translateX, translateY);
            P3 = TranslatePoint(P3, translateX, translateY);
            P4 = TranslatePoint(P4, translateX, translateY);
            P5 = TranslatePoint(P5, translateX, translateY);
            P6 = TranslatePoint(P6, translateX, translateY);
            P7 = TranslatePoint(P7, translateX, translateY);
            P8 = TranslatePoint(P8, translateX, translateY);
            P9 = TranslatePoint(P9, translateX, translateY);
            P10 = TranslatePoint(P10, translateX, translateY);

            P11 = TranslatePoint(P11, translateX, translateY);
            P12 = TranslatePoint(P12, translateX, translateY);
            P13 = TranslatePoint(P13, translateX, translateY);
            P14 = TranslatePoint(P14, translateX, translateY);
            P15 = TranslatePoint(P15, translateX, translateY);
            P16 = TranslatePoint(P16, translateX, translateY);
            P17 = TranslatePoint(P17, translateX, translateY);
            P18 = TranslatePoint(P18, translateX, translateY);
            P19 = TranslatePoint(P19, translateX, translateY);
            P20 = TranslatePoint(P20, translateX, translateY);

            P21 = TranslatePoint(P21, translateX, translateY);
            P22 = TranslatePoint(P22, translateX, translateY);
            P23 = TranslatePoint(P23, translateX, translateY);
            P24 = TranslatePoint(P24, translateX, translateY);
            P25 = TranslatePoint(P25, translateX, translateY);
        }

        // Función que traslada un punto por los valores de desplazamiento.
        private PointF TranslatePoint(PointF point, float translateX, float translateY)
        {
            return new PointF(point.X + translateX, point.Y + translateY);
        }
    }
}
