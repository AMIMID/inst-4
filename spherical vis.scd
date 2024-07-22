(
var data;
var az=0,el=0,rad=0,d;

data = 20000.collect{

		az=(az+(360-(360/1.6180339887499))).wrap(180.neg,180);

	el=(el+(360-(360/1.6180339887499))).wrap(90.neg,90);

	rad=(rad+(360-(360/1.6180339887499))).wrap(1000.neg,1000);

	d=Spherical(rad,az,el).asCartesian.asArray;
};

w = Window.new("3D Scatterplot", Rect(40,40, 1000, 800)).front;
a = ScatterView3d(w, Rect(0,0, 800,800), data, [-1000, 1000].asSpec,[-1000, 1000].asSpec,[-1000, 1000].asSpec);
a.drawMethod = \fillRect;
a.symbolSize = 1;
a.symbolColor = Color.white;
a.background = Color.black;

// Y Slider
Slider(w, Rect(820, 10, 10, 450)).action_{|me|
    a.rotY = me.value * 2pi;
    w.refresh;
};
// X Slider
Slider(w, Rect(870, 10, 10, 450)).action_{|me|
    a.rotX = me.value * 2pi;
    w.refresh;
};
// Z Slider
Slider(w, Rect(920, 10, 10, 450)).action_{|me|
    a.rotZ = me.value * 2pi;
    w.refresh;
};
)
////////////////////////////////
(
var data;
var az=0,el=0,rad=0;
var i = Quaternion(0, (1/3).sqrt, 0, 0),j = Quaternion(0, 0, (1/3).sqrt,0),k = Quaternion(0, 0, 0, (1/3).sqrt);
var q,v,angle=0,r,d,m=1,rot,sph;

r=[0,0,1000];
v=Quaternion(0,r.[0].neg,r.[1],r.[2]);
angle=(360-(360/1.6180339887499));

data = 20000.collect{

		az=(az+(360-(360/1.6180339887499))).wrap(180.neg,180);

	el=(el+(360-(360/1.6180339887499))).wrap(90.neg,90);

	rad=(rad+(360-(360/1.6180339887499))).wrap(1000.neg,1000);

	sph=Spherical(1,az,el).asCartesian;

	rot=[sph.x,sph.y,sph.z];

	i=Quaternion(0, rot.[0], 0, 0);
	j=Quaternion(0, 0, rot.[1], 0);
	k=Quaternion(0, 0, 0, rot.[2]);

		q=(cos(angle.degrad)+(sin(angle.degrad)*(i+j+k)));
	    v=q*v*q.conjugate;

	d=Cartesian(v.b.round(0.0001)*m,v.c.round(0.0001)*m,v.d.round(0.0001)*m).asArray;

};

w = Window.new("3D Scatterplot", Rect(40,40, 1000, 800)).front;
a = ScatterView3d(w, Rect(0,0, 800,800), data, [-1000, 1000].asSpec,[-1000, 1000].asSpec,[-1000, 1000].asSpec);
a.drawMethod = \fillRect;
a.symbolSize = 1;
a.symbolColor = Color.white;
a.background = Color.black;

// Y Slider
Slider(w, Rect(820, 10, 10, 450)).action_{|me|
    a.rotY = me.value * 2pi;
    w.refresh;
};
// X Slider
Slider(w, Rect(870, 10, 10, 450)).action_{|me|
    a.rotX = me.value * 2pi;
    w.refresh;
};
// Z Slider
Slider(w, Rect(920, 10, 10, 450)).action_{|me|
    a.rotZ = me.value * 2pi;
    w.refresh;
};
)