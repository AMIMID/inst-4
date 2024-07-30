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

(
{
var angle=0,m=1,ph,mag=0,ang,amp,angle1=90,ang1,ph1,mag1=90,amp1;

100.do{

	angle=(angle+(360-(360/1.6180339887499))).wrap(0,360);
	ang=angle;
~angle=1000.collect{ang=(ang+(360-(360/1.6180339887499))).wrap(0,360);ph=exp(Complex(0,1)*(ang.degrad)).phase;};

		angle1=(angle1+(360-(360/1.6180339887499))).wrap(0,360);
	ang1=angle1;
~angle1=1000.collect{ang1=(ang1+(360-(360/1.6180339887499))).wrap(0,360);ph1=exp(Complex(0,1)*(ang1.degrad)).phase;};

	mag=(mag+(360-(360/1.6180339887499))).wrap(0,1);
	amp=mag;
~mag=1000.collect{amp=(amp+(360-(360/1.6180339887499))).wrap(0,1)};

	mag1=(mag1+(360-(360/1.6180339887499))).wrap(0,1);
	amp1=mag1;
~mag1=1000.collect{amp1=(amp1+(360-(360/1.6180339887499))).wrap(0,1)};

		Out.ar(0,SinOsc.ar(55*(2.pow(m/12)),EnvGen.ar(Env(~angle.scramble,[~mag])),EnvGen.ar(Env(~mag.scramble,[~mag]),levelScale:m.reciprocal)));
		Out.ar(1,SinOsc.ar(55*(2.pow(m/12)),EnvGen.ar(Env(~angle1.scramble,[~mag1])),EnvGen.ar(Env(~mag1.scramble,[~mag1]),levelScale:m.reciprocal)));

	m=m+1

}
}.play
)

(
{
var angle=0,m=1,ph,mag=0,ang,amp,angle1=90,ang1,ph1,mag1=90,amp1;

100.do{

	angle=(angle+(360-(360/1.6180339887499))).wrap(0,360);
	ang=angle;
~angle=1000.collect{ang=(ang+(360-(360/1.6180339887499))).wrap(0,360);ph=exp(Complex(0,1)*(ang.degrad)).phase;};

		angle1=(angle1+(360-(360/1.6180339887499))).wrap(0,360);
	ang1=angle1;
~angle1=1000.collect{ang1=(ang1+(360-(360/1.6180339887499))).wrap(0,360);ph1=exp(Complex(0,1)*(ang.degrad)).phase;};

	mag=(mag+(360-(360/1.6180339887499))).wrap(0,360);
	amp=mag;
~mag=1000.collect{amp=(amp+(360-(360/1.6180339887499))).wrap(0,1)};

	mag1=(mag1+(360-(360/1.6180339887499))).wrap(0,360);
	amp1=mag1;
~mag1=1000.collect{amp1=(amp1+(360-(360/1.6180339887499))).wrap(0,1)};

		Out.ar(0,SinOsc.ar(55*m,EnvGen.ar(Env(~angle.scramble,[0.1])),EnvGen.ar(Env(~mag.scramble,[0.1]),levelScale:m.reciprocal)));
		Out.ar(1,SinOsc.ar(55*m,EnvGen.ar(Env(~angle1.scramble,[0.1])),EnvGen.ar(Env(~mag1.scramble,[0.1]),levelScale:m.reciprocal)));

	m=m+1

}
}.play
)


)

(
{
var angle=0,m=1,ph,mag=0,ang=0,amp;


~angle=1000.collect{ang=(ang+(360-(360/1.6180339887499))).wrap(0,360);ph=exp(Complex(0,1)*(ang.degrad)).phase;};

~mag=1000.collect{mag=(mag+(360-(360/1.6180339887499))).wrap(0,1)};

100.do{

	Out.ar(0,SinOsc.ar(110*m,EnvGen.ar(Env(~angle,[0.1])),EnvGen.ar(Env(~mag,[0.1]),levelScale:m.reciprocal)));

	m=m+1

}
}.play


)
