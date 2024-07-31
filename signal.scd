(
s.options.numWireBufs = 1024*16;
s.options.numOutputBusChannels=2;
s.options.numInputBusChannels=0;
TempoClock.default.tempo_(120/120);
s.options.memSize = 8192*64;
//s.options.blockSize = 64/4;
s.options.maxNodes = 1024 * 64;
s.waitForBoot
)


(2.pow(m/12))
(
{
var angle=0,m=1,ph,mag=0,ang,amp,angle1=90,ang1,ph1,mag1=90,amp1,mg;

100.do{

	angle=(angle+(360-(360/1.6180339887499))).wrap(0,360);
	ang=angle;
~angle=1000.collect{ang=(ang+(360-(360/1.6180339887499))).wrap(0,360);ph=exp(Complex(0,1)*(ang.degrad)).phase;};

		angle1=(angle1+(360-(360/1.6180339887499))).wrap(0,360);
	ang1=angle1;
~angle1=1000.collect{ang1=(ang1+(360-(360/1.6180339887499))).wrap(0,360);ph1=exp(Complex(0,1)*(ang1.degrad)).phase;};

	mag=(mag+(360-(360/1.6180339887499))).wrap(0,360);
	amp=mag;
~mag=1000.collect{amp=(amp+(360-(360/1.6180339887499))).wrap(0,360)};

	mag1=(mag1+(360-(360/1.6180339887499))).wrap(0,360);
	amp1=mag1;
~mag1=1000.collect{amp1=(amp1+(360-(360/1.6180339887499))).wrap(0,360)};

		mg=mag;
~m=999.collect{mg=(mg+(360-(360/1.6180339887499))).wrap(0,360)};

		Out.ar(0,SinOsc.ar(55*m,EnvGen.ar(Env(~angle.scramble,~m.normalize)),EnvGen.ar(Env(~mag.normalize.scramble,~m.normalize),levelScale:m.reciprocal)));
		Out.ar(1,SinOsc.ar(55*m,EnvGen.ar(Env(~angle1.scramble,~m.normalize)),EnvGen.ar(Env(~mag1.normalize.scramble,~m.normalize),levelScale:m.reciprocal)));

	m=m+1

}
}.play
)


)

(
{
var angle=0,m=1,ph,mag=0,ang,amp,angle1=90,ang1,ph1,mag1=90,amp1,mg,ampscale,ampscale1;

100.do{

	angle=(angle+(360-(360/1.6180339887499))).wrap(0,360);
	ang=angle;
~angle=1000.collect{ang=(ang+(360-(360/1.6180339887499))).wrap(0,360);ph=exp(Complex(0,1)*(ang.degrad)).phase;};

		angle1=(angle1+(360-(360/1.6180339887499))).wrap(0,360);
	ang1=angle1;
~angle1=1000.collect{ang1=(ang1+(360-(360/1.6180339887499))).wrap(0,360);ph1=exp(Complex(0,1)*(ang1.degrad)).phase;};

	mag=(mag+(360-(360/1.6180339887499))).wrap(0,360);
	amp=mag;
~mag=1000.collect{amp=(amp+(360-(360/1.6180339887499))).wrap(0,1);ampscale=2.pow(amp/12)};

	mag1=(mag1+(360-(360/1.6180339887499))).wrap(0,360);
	amp1=mag1;
		~mag1=1000.collect{amp1=(amp1+(360-(360/1.6180339887499))).wrap(0,1); ampscale1=2.pow(amp1/12)};

		mg=mag;
~m=999.collect{mg=(mg+(360-(360/1.6180339887499))).wrap(0,1)};

		Out.ar(0,SinOsc.ar(55*m,EnvGen.ar(Env(~angle.scramble,~m)),EnvGen.ar(Env(~mag.scramble,~m),levelScale:m.reciprocal)));
		Out.ar(1,SinOsc.ar(55*m,EnvGen.ar(Env(~angle1.scramble,~m)),EnvGen.ar(Env(~mag1.scramble,~m),levelScale:m.reciprocal)));

	m=m+1

}
}.play
)


(
{
var angle=0,m=1,ph,mag=0,ang,amp,angle1=90,ang1,ph1,mag1=90,amp1,mg,ph2,ph3;

100.do{

	angle=(angle+(360-(360/1.6180339887499))).wrap(0,360);
	ang=angle;
~angle=1000.collect{ang=(ang+(360-(360/1.6180339887499))).wrap(0,360);ph=exp(Complex(0,1)*(ang.degrad)).phase;};

		angle1=(angle1+(360-(360/1.6180339887499))).wrap(0,360);
	ang1=angle1;
~angle1=1000.collect{ang1=(ang1+(360-(360/1.6180339887499))).wrap(0,360);ph1=exp(Complex(0,1)*(ang1.degrad)).phase;};

	mag=(mag+(360-(360/1.6180339887499))).wrap(0,360);
	amp=mag;
~mag=1000.collect{amp=(amp+(360-(360/1.6180339887499))).wrap(0,360);ph2=exp(Complex(0,1)*(ang1.degrad)).real.abs;};

~mag1=1000.collect{amp=(amp+(360-(360/1.6180339887499))).wrap(0,360);ph3=exp(Complex(0,1)*(ang1.degrad)).imag.abs;};

		mg=mag;
~m=999.collect{mg=(mg+(360-(360/1.6180339887499))).wrap(0,1)};

		Out.ar(0,SinOsc.ar(55*m,EnvGen.ar(Env(~angle.scramble,~m)),EnvGen.ar(Env(~mag.scramble,~m),levelScale:m.reciprocal)));
		Out.ar(1,SinOsc.ar(55*m,EnvGen.ar(Env(~angle1.scramble,~m)),EnvGen.ar(Env(~mag1.scramble,~m),levelScale:m.reciprocal)));

	m=m+1

}
}.play
)
