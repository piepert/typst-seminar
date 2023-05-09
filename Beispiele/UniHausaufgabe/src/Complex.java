class Complex {
    double r;
    double i;

    public Complex(double r, double i) {
        this.r = r;
        this.i = i;
    }

    public Complex add(Complex c1, Complex c2) {
        return new Complex(c1.r + c2.r, c1.i + c2.i);
    }

    public Complex sub(Complex c1, Complex c2) {
        return new Complex(c1.r - c2.r, c1.i - c2.i);
    }

    public Complex mul(Complex c1, Complex c2) {
        return new Complex(
            c1.r*c2.r - c2.i*c2.i,
            c1.r*c2.i + c2.r*c1.i);
    }

    public Complex div(Complex c1, Complex c2) {
        double n = c2.r*c2.r + c2.i*c2.i;

        return new Complex(
            (c1.r*c2.r + c1.i*c2.i)/n,
            (c1.i*c2.r + c1.r*c2.i)/n);
    }
}