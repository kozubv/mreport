classdef ht
    
    properties (SetAccess = immutable)
        unpaired_ = false;
    end %--------------------------------------------------------
    
    
    methods
        function obj = ht(unpaired)
            if nargin < 1
                unpaired = false;
            end
            obj.unpaired_ = logical(unpaired);
        end %----------------------------------------------------
        
        function tag = htag(obj)
            tag = htag('', char(obj));
        end %----------------------------------------------------
        
        function varargout = subsref(obj, s)
            if strcmp(s(1).type , '()')
                if isempty(s(1).subs) || isempty(s(1).subs{1})
                    content = '';
                else
                    content = s(1).subs{1};
                end
                product_tag = htag(content, char(obj), obj.unpaired_);
                if length(s) == 1
                    [varargout{1:nargout}] = product_tag;
                else
                    [varargout{1:nargout}] = subsref(product_tag, s(2:end));
                end
            elseif strcmp(s(1).type , '.')
                product_tag = htag('', char(obj), obj.unpaired_);
                [varargout{1:nargout}] = subsref(product_tag, s);
            else
                [varargout{1:nargout}] = builtin('subsref', obj, s);
            end
        end %----------------------------------------------------
        
    end %--------------------------------------------------------
    
    
    enumeration
        %% A
        a;          address;    article;
        abbr;       applet;     aside;
        acronum;    area(1);    audio;
        
        %% B
        b;          bdi;        blockquote;     blink;
        base(1);    bdo;        big;            br(1);
        basefont(1);bgsound(1); body;           button;
        
        %% C
        canvas;     cite;       colgroup;
        caption;    code;       command(1);
        center;     col(1);     comment;
        
        %% D
        % details;
        datalist;   div;
        dd;         dfn;        dl;
        del;        dir;        dt;
        
        %% E
        em;         embed(1);
        
        %% F
        fieldset;   figure;     form;       frame;
        figcaption; font;       footer;     frameset;
        
        %% H
        h1;         h4;         head;       hr(1);
        h2;         h5;         header;     html;
        h3;         h6;         hgroup;     
        
        %% I
        i;          img(1);     ins;
        iframe;     input(1);   isindex(1);
        
        %% K
        kbd;        keygen(1);
        
        %% L
        label;      legend;     li;     link(1);
        
        %% M
        main;       marquee;    menu;   meter;
        map;        mark;       meta(1);
        
        %% N
        nav;        noembed;    noscript;
        nobr;       noframes;       
        
        %% O
        object;     optgroup;   output;
        ol;         option;
        
        %% P
        p;          plaintext;  progress;
        param(1);   pre;
        
        %% Q
        q;
        
        %% R
        rp;         rt;     ruby;
        
        %% S
        s;          select;     strike;     summary;
        samp;       small;      strong;     sup;
        script;     span;       style;  
        section;    source(1);  sub;
        
        %% T
        table;      textarea;   thead;      tr;
        tbody;      tfoot;      time;       tt;
        td;         th;         title;
        
        %% U
        u;          ul;
        
        %% V
        var;        video;
        
        %% W
        wbr(1);
        
        %% X
        xmp;
        
    end %--------------------------------------------------------
    
end %------------------------------------------------------------










