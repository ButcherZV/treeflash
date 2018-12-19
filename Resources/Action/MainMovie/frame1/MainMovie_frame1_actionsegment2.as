// Action script...

function setRP2()
{
    tree00._xreg = 150;
    tree00._yreg = 232;
    tree01._xreg = 309;
    tree01._yreg = 232;
    tree02._xreg = 462;
    tree02._yreg = 232;
} // End of the function
function seedOff(tree_no)
{
    _root["seed0" + tree_no]._alpha = _root["seed0" + tree_no]._alpha - 5;
    updateAfterEvent();
    if (_root["seed0" + tree_no]._alpha <= 0)
    {
        clearInterval(_root["seedOff0" + tree_no + "ID"]);
        ++_root["a_tree0" + tree_no + "_ani_status"][a_alltree_status[currentTree] - 1];
        _root.animating = 0;
    } // end if
} // End of the function
function seedlingOn(tree_no)
{
    _root["seedling0" + tree_no]._alpha = _root["seedling0" + tree_no]._alpha + 5;
    updateAfterEvent();
    if (_root["seedling0" + tree_no]._alpha >= 100)
    {
        clearInterval(_root["seedlingOn0" + tree_no + "ID"]);
        ++_root["a_tree0" + tree_no + "_ani_status"][a_alltree_status[currentTree] - 1];
    } // end if
} // End of the function
function seedlingOff(tree_no)
{
    _root["seedling0" + tree_no]._alpha = _root["seedling0" + tree_no]._alpha - 5;
    updateAfterEvent();
    if (_root["seedling0" + tree_no]._alpha <= 0)
    {
        clearInterval(_root["seedlingOff0" + tree_no + "ID"]);
        ++_root["a_tree0" + tree_no + "_ani_status"][a_alltree_status[currentTree] - 1];
        _root.animating = 0;
    } // end if
} // End of the function
function peopleWalk(target)
{
    if (man01._x > a_man01_loc[target * 2])
    {
        pplWalkLeft();
    } // end if
    if (man01._x < a_man01_loc[target * 2])
    {
        pplWalkRight();
    } // end if
    if (man01._x == a_man01_loc[target * 2])
    {
        pplWalkStop();
    } // end if
    updateAfterEvent();
} // End of the function
function pplWalkLeft()
{
    man01._xscale = -100;
    woman01._xscale = 100;
    woman02._xscale = 100;
    man01._x = man01._x - 1;
    woman01._x = woman01._x - 1;
    woman02._x = woman02._x - 1;
} // End of the function
function pplWalkRight()
{
    man01._xscale = 100;
    woman01._xscale = -100;
    woman02._xscale = -100;
    man01._x = man01._x + 1;
    woman01._x = woman01._x + 1;
    woman02._x = woman02._x + 1;
} // End of the function
function pplWalkStop()
{
    clearInterval(peopleWalkID);
    man01._xscale = 100;
    woman01._xscale = 100;
    woman02._xscale = 100;
    _root.flag_pplButActive = 1;
    refresh_ppl_status();
    visiblePplClickMe();
    visibleSeedClickMe();
} // End of the function
function pplReactivate()
{
    for (var _loc2 = 0; _loc2 < 3; ++_loc2)
    {
        _root[a_pplName[_loc2]].gotoAndPlay(1);
    } // end of for
} // End of the function
function refresh_ppl_status()
{
    if (_root["a_tree0" + currentTree + "_ppl_status"][0] == 1)
    {
        man01.gotoAndStop(1);
    }
    else
    {
        man01.play();
    } // end else if
    if (_root["a_tree0" + currentTree + "_ppl_status"][1] == 1)
    {
        woman01.gotoAndStop(1);
    }
    else
    {
        woman01.play();
    } // end else if
    if (_root["a_tree0" + currentTree + "_ppl_status"][2] == 1)
    {
        woman02.gotoAndStop(1);
    }
    else
    {
        woman02.play();
    } // end else if
} // End of the function
function scaleTreeUp(treeNo)
{
    if (_root["tree0" + treeNo]._xscale2 < 105)
    {
        _root["tree0" + treeNo]._xscale2 = _root["tree0" + treeNo]._yscale2 = _root["tree0" + treeNo]._yscale2 + 0.500000;
    } // end if
    if (_root["tree0" + treeNo]._xscale2 == 105)
    {
        clearInterval(_root["scaleTree0" + treeNo]);
    } // end if
} // End of the function
function scaleTreeDown(treeNo)
{
    if (_root["tree0" + treeNo]._xscale2 > 30)
    {
        _root["tree0" + treeNo]._xscale2 = _root["tree0" + treeNo]._yscale2 = _root["tree0" + treeNo]._yscale2 - 0.500000;
    } // end if
    if (_root["tree0" + treeNo]._xscale2 == 30)
    {
        clearInterval(_root["scaleTree0" + treeNo]);
    } // end if
} // End of the function
function clickTree00()
{
    scaleTree00 = setInterval(scaleTreeUp, 10, 0);
    scaleTree01 = setInterval(scaleTreeDown, 10, 1);
    scaleTree02 = setInterval(scaleTreeDown, 10, 2);
} // End of the function
function clickTree01()
{
    scaleTree00 = setInterval(scaleTreeDown, 10, 0);
    scaleTree01 = setInterval(scaleTreeUp, 10, 1);
    scaleTree02 = setInterval(scaleTreeDown, 10, 2);
} // End of the function
function clickTree02()
{
    scaleTree00 = setInterval(scaleTreeDown, 10, 0);
    scaleTree01 = setInterval(scaleTreeDown, 10, 1);
    scaleTree02 = setInterval(scaleTreeUp, 10, 2);
} // End of the function
function generateLeaf()
{
    for (var _loc3 = 1; _loc3 < a_loop[currentTree]; ++_loc3)
    {
        for (var _loc2 = 0; _loc2 < _root["a_tree0" + currentTree + "_0" + a_alltree_status[currentTree] + "_a" + _loc3].length; ++_loc2)
        {
            _root["tree0" + currentTree].attachMovie(_root["a_tree0" + currentTree + "_0" + a_alltree_status[currentTree] + "_a" + _loc3][_loc2][0], _root["a_tree0" + currentTree + "_0" + a_alltree_status[currentTree] + "_a" + _loc3][_loc2][0], _root["a_tree0" + currentTree + "_0" + a_alltree_status[currentTree] + "_a" + _loc3][_loc2][1], {_x: _root["a_tree0" + currentTree + "_0" + a_alltree_status[currentTree] + "_a" + _loc3][_loc2][2 * a_alltree_status[currentTree]], _y: _root["a_tree0" + currentTree + "_0" + a_alltree_status[currentTree] + "_a" + _loc3][_loc2][1 + 2 * a_alltree_status[currentTree]], _xscale: 0, _yscale: 0, _alpha: 0});
        } // end of for
    } // end of for
    ++_root["a_tree0" + currentTree + "_ani_status"][a_alltree_status[currentTree] - 1];
} // End of the function
function animateOldLeaf(treeNo, stageNo, areaNo)
{
    for (var _loc4 = 1; _loc4 < a_loop[currentTree]; ++_loc4)
    {
        for (var _loc3 = 0; _loc3 < _root["a_tree0" + treeNo + "_0" + stageNo + "_a" + _loc4].length; ++_loc3)
        {
            temp = _root["a_tree0" + treeNo + "_0" + stageNo + "_a" + _loc4][_loc3][12] + "ID";
            if (a_alltree_status[currentTree] == 2)
            {
                growSteps = _root["a_tree0" + currentTree + "_b"].length * 6;
            } // end if
            if (a_alltree_status[currentTree] == 3)
            {
                growSteps = _root["a_tree0" + currentTree + "_b"][0][3] - _root["a_tree0" + currentTree + "_b"][0][5];
            } // end if
            this[temp] = setInterval(leafUpdate, 10, _root["a_tree0" + treeNo + "_0" + stageNo + "_a" + _loc4][_loc3][12], _root["a_tree0" + treeNo + "_0" + stageNo + "_a" + _loc4][_loc3][1], _root["a_tree0" + treeNo + "_0" + stageNo + "_a" + _loc4][_loc3][2], _root["a_tree0" + treeNo + "_0" + stageNo + "_a" + _loc4][_loc3][3], _root["a_tree0" + treeNo + "_0" + stageNo + "_a" + _loc4][_loc3][4], _root["a_tree0" + treeNo + "_0" + stageNo + "_a" + _loc4][_loc3][5], _root["a_tree0" + treeNo + "_0" + stageNo + "_a" + _loc4][_loc3][6], _root["a_tree0" + treeNo + "_0" + stageNo + "_a" + _loc4][_loc3][7], _root["a_tree0" + treeNo + "_0" + stageNo + "_a" + _loc4][_loc3][8], _root["a_tree0" + treeNo + "_0" + stageNo + "_a" + _loc4][_loc3][9], _root["a_tree0" + treeNo + "_0" + stageNo + "_a" + _loc4][_loc3][10], growSteps, treeNo, stageNo, _loc4, _loc3);
            _root["a_tree0" + treeNo + "_0" + stageNo + "_a" + _loc4][_loc3][13] = this[temp];
            _root["a_tree0" + treeNo + "_0" + stageNo + "_a" + _loc4][_loc3][14] = 0;
        } // end of for
    } // end of for
    ++_root["a_tree0" + currentTree + "_ani_status"][a_alltree_status[currentTree] - 1];
} // End of the function
function setAnimateLeaf()
{
    for (var _loc4 = 1; _loc4 < a_loop[currentTree]; ++_loc4)
    {
        for (var _loc3 = 0; _loc3 < _root["a_tree0" + currentTree + "_0" + a_alltree_status[currentTree] + "_a" + _loc4].length; ++_loc3)
        {
            temp = _root["a_tree0" + currentTree + "_0" + a_alltree_status[currentTree] + "_a" + _loc4][_loc3][12] + "ID";
            this[temp] = setInterval(leafUpdate, 10, _root["a_tree0" + currentTree + "_0" + a_alltree_status[currentTree] + "_a" + _loc4][_loc3][12], _root["a_tree0" + currentTree + "_0" + a_alltree_status[currentTree] + "_a" + _loc4][_loc3][1], _root["a_tree0" + currentTree + "_0" + a_alltree_status[currentTree] + "_a" + _loc4][_loc3][2], _root["a_tree0" + currentTree + "_0" + a_alltree_status[currentTree] + "_a" + _loc4][_loc3][3], _root["a_tree0" + currentTree + "_0" + a_alltree_status[currentTree] + "_a" + _loc4][_loc3][4], _root["a_tree0" + currentTree + "_0" + a_alltree_status[currentTree] + "_a" + _loc4][_loc3][5], _root["a_tree0" + currentTree + "_0" + a_alltree_status[currentTree] + "_a" + _loc4][_loc3][6], _root["a_tree0" + currentTree + "_0" + a_alltree_status[currentTree] + "_a" + _loc4][_loc3][7], _root["a_tree0" + currentTree + "_0" + a_alltree_status[currentTree] + "_a" + _loc4][_loc3][8], _root["a_tree0" + currentTree + "_0" + a_alltree_status[currentTree] + "_a" + _loc4][_loc3][9], _root["a_tree0" + currentTree + "_0" + a_alltree_status[currentTree] + "_a" + _loc4][_loc3][10], _root["a_tree0" + currentTree + "_0" + a_alltree_status[currentTree] + "_a" + _loc4][_loc3][11], currentTree, a_alltree_status[currentTree], _loc4, _loc3);
            _root["a_tree0" + currentTree + "_0" + a_alltree_status[currentTree] + "_a" + _loc4][_loc3][13] = this[temp];
            _root["a_tree0" + currentTree + "_0" + a_alltree_status[currentTree] + "_a" + _loc4][_loc3][14] = 0;
        } // end of for
    } // end of for
} // End of the function
function countAnimate()
{
    if (_root.countStep > 0)
    {
        --_root.countStep;
    } // end if
    if (_root.countStep == 0)
    {
        clearInterval(countAnimateID);
        ++_root["a_tree0" + currentTree + "_ani_status"][a_alltree_status[currentTree] - 1];
        _root.countStep = 70;
    } // end if
    return (countStep);
} // End of the function
function leafUpdate(nam, levelNum, stage01X, stage01Y, stage02X, stage02Y, stage03X, stage03Y, stage01S, stage02S, stage03S, growSteps, treeNo, stageNo, areaNo, leafNo)
{
    ++(eval("a_tree0" + treeNo + "_0" + stageNo + "_a" + areaNo)[leafNo][14]);
    currentSteps = eval("a_tree0" + treeNo + "_0" + stageNo + "_a" + areaNo)[leafNo][14];
    if (eval(nam)._alpha < 100)
    {
        eval(nam)._alpha = 100 * (currentSteps / growSteps);
    } // end if
    if (_root.a_alltree_status[_root.currentTree] == 1)
    {
        eval(nam)._x = stage01X;
        eval(nam)._y = stage01Y;
        if (eval(nam)._xscale < 100)
        {
            eval(nam)._xscale = eval(nam)._yscale = stage01S * (currentSteps / growSteps);
        } // end if
    } // end if
    if (_root.a_alltree_status[_root.currentTree] == 2)
    {
        eval(nam)._x = stage01X - (stage01X - stage02X) * (currentSteps / growSteps);
        eval(nam)._y = stage01Y - (stage01Y - stage02Y) * (currentSteps / growSteps);
        if (eval(nam)._xscale < 100)
        {
            eval(nam)._xscale = eval(nam)._yscale = stage02S * (currentSteps / growSteps);
        } // end if
    } // end if
    if (_root.a_alltree_status[_root.currentTree] == 3)
    {
        eval(nam)._x = stage02X - (stage02X - stage03X) * (currentSteps / growSteps);
        eval(nam)._y = stage02Y - (stage02Y - stage03Y) * (currentSteps / growSteps);
        if (eval(nam)._xscale < 100)
        {
            eval(nam)._xscale = eval(nam)._yscale = stage03S * (currentSteps / growSteps);
        } // end if
    } // end if
    if (currentSteps == growSteps)
    {
        ID = eval("a_tree0" + treeNo + "_0" + stageNo + "_a" + areaNo)[leafNo][13];
        clearInterval(ID);
    } // end if
    return (eval("a_tree0" + treeNo + "_0" + stageNo + "_a" + areaNo)[leafNo][14]);
} // End of the function
function moveBranch()
{
    tem = _root["tree0" + currentTree].branch;
    for (i = 0; i < _root["a_tree0" + currentTree + "_b"].length; i++)
    {
        if (i < 9)
        {
            --eval(tem)["t0" + currentTree + "_0" + (i + 1)]._y;
            continue;
        } // end if
        --eval(tem)["t0" + currentTree + "_" + (i + 1)]._y;
    } // end of for
    if (eval(tem)["t0" + currentTree + "_01"]._y == _root["a_tree0" + currentTree + "_b"][0][5])
    {
        clearInterval(_root["moveBranch0" + currentTree + "ID"]);
        ++_root["a_tree0" + currentTree + "_ani_status"][a_alltree_status[currentTree] - 1];
        _root.animating = 0;
    } // end if
} // End of the function
function createBranchMC()
{
    _root["tree0" + currentTree].createEmptyMovieClip("branch", 10);
    setProperty(_root["tree0" + currentTree][branch], _x, 0);
    setProperty(_root["tree0" + currentTree][branch], _y, 0);
    _root["tree0" + currentTree].branch.setMask(_root["mask0" + currentTree]);
    ++_root["a_tree0" + currentTree + "_ani_status"][a_alltree_status[currentTree] - 1];
} // End of the function
function generateBranch(branchNo)
{
    _root["tree0" + currentTree].branch.attachMovie("tree_piece1", _root["a_tree0" + currentTree + "_b"][branchNo][0], _root["a_tree0" + currentTree + "_b"][branchNo][1], {_x: _root["a_tree0" + currentTree + "_b"][branchNo][2], _y: _root["a_tree0" + currentTree + "_b"][branchNo][3], _xscale: _root["a_tree0" + currentTree + "_b"][branchNo][6], _yscale: _root["a_tree0" + currentTree + "_b"][branchNo][6], _rotation: _root["a_tree0" + currentTree + "_b"][branchNo][7], _alpha: 0});
    animateBranch(branchNo);
} // End of the function
function animateBranch(branchNo)
{
    temp = 0;
    this[temp] = setInterval(branchUpdate, 10, _root["a_tree0" + currentTree + "_b"][branchNo][9], currentTree, branchNo);
    _root["a_tree0" + currentTree + "_b"][branchNo][10] = this[temp];
} // End of the function
function branchUpdate(nam, treeNo, branchNo)
{
    eval(nam)._alpha = eval(nam)._alpha + 20;
    if (eval(nam)._alpha >= 100)
    {
        ID = eval("a_tree0" + treeNo + "_b")[branchNo][10];
        clearInterval(ID);
        ++_root["t" + treeNo + "_bNum"];
        if (eval("t" + treeNo + "_bNum") < _root["a_tree0" + currentTree + "_b"].length)
        {
            generateBranch(eval("t" + treeNo + "_bNum"));
        } // end if
        if (eval("t" + treeNo + "_bNum") == _root["a_tree0" + currentTree + "_b"].length)
        {
            ++_root["a_tree0" + currentTree + "_ani_status"][a_alltree_status[currentTree] - 1];
            _root.animating = 0;
        } // end if
    } // end if
    return (eval("t" + treeNo + "_bNum"));
} // End of the function
function attachClickMe()
{
    man01.attachMovie("clickme", "clickme", 20001, {_x: this._x + 10, _y: this._y - 10, _xscale: 80, _yscale: 80, _alpha: 100});
    woman01.attachMovie("clickme", "clickme", 20002, {_x: this._x + 20, _y: this._y - 10, _xscale: 80, _yscale: 80, _alpha: 100});
    woman02.attachMovie("clickme", "clickme", 20003, {_x: this._x + 15, _y: this._y - 10, _xscale: 80, _yscale: 80, _alpha: 100});
    treeTitle1.attachMovie("clickme", "clickme", 30001, {_x: this._x + 50, _y: this._y, _xscale: 80, _yscale: 80, _alpha: 100});
    treeTitle2.attachMovie("clickme", "clickme", 30002, {_x: this._x + 42, _y: this._y, _xscale: 80, _yscale: 80, _alpha: 100});
    treeTitle3.attachMovie("clickme", "clickme", 30003, {_x: this._x + 42, _y: this._y, _xscale: 80, _yscale: 80, _alpha: 100});
} // End of the function
function visibleSeedClickMe()
{
    if (flag_seedButActive == 1)
    {
        if (currentTree != 0)
        {
            treeTitle1.clickme._visible = true;
        } // end if
        if (currentTree != 1)
        {
            treeTitle2.clickme._visible = true;
        } // end if
        if (currentTree != 2)
        {
            treeTitle3.clickme._visible = true;
        } // end if
    } // end if
} // End of the function
function visiblePplClickMe()
{
    if (flag_pplButActive == 1)
    {
        if (_root["a_tree0" + currentTree + "_ppl_status"][0] == 0)
        {
            man01.clickme._visible = true;
        } // end if
        if (_root["a_tree0" + currentTree + "_ppl_status"][1] == 0)
        {
            woman01.clickme._visible = true;
        } // end if
        if (_root["a_tree0" + currentTree + "_ppl_status"][2] == 0)
        {
            woman02.clickme._visible = true;
        } // end if
    } // end if
} // End of the function
function invisibleSeedClickMe()
{
    treeTitle1.clickme._visible = false;
    treeTitle2.clickme._visible = false;
    treeTitle3.clickme._visible = false;
} // End of the function
function invisiblePplClickMe()
{
    man01.clickme._visible = false;
    woman01.clickme._visible = false;
    woman02.clickme._visible = false;
} // End of the function
getURL("FSCommand:showmenu", false);
stop ();
var MCP = MovieClip.prototype;
MCP._xreg = MCP._yreg = 0;
MCP.setPropRel = function (prop, amount)
{
    var _loc3 = {x: this._xreg, y: this._yreg};
    this.localToGlobal(_loc3);
    this._parent.globalToLocal(_loc3);
    this[prop] = amount;
    var _loc2 = {x: this._xreg, y: this._yreg};
    this.localToGlobal(_loc2);
    this._parent.globalToLocal(_loc2);
    this._x = this._x - (_loc2.x - _loc3.x);
    this._y = this._y - (_loc2.y - _loc3.y);
};
MCP.set_x2 = function (v)
{
    var _loc2 = {x: this._xreg, y: this._yreg};
    this.localToGlobal(_loc2);
    this._parent.globalToLocal(_loc2);
    this._x = this._x + (v - _loc2.x);
};
MCP.get_x2 = function ()
{
    var _loc2 = {x: this._xreg, y: this._yreg};
    this.localToGlobal(_loc2);
    this._parent.globalToLocal(_loc2);
    return (_loc2.x);
};
MCP.set_y2 = function (v)
{
    var _loc2 = {x: this._xreg, y: this._yreg};
    this.localToGlobal(_loc2);
    this._parent.globalToLocal(_loc2);
    this._y = this._y + (v - _loc2.y);
};
MCP.get_y2 = function ()
{
    var _loc2 = {x: this._xreg, y: this._yreg};
    this.localToGlobal(_loc2);
    this._parent.globalToLocal(_loc2);
    return (_loc2.y);
};
MCP.set_xscale2 = function (v)
{
    this.setPropRel("_xscale", v);
};
MCP.get_xscale2 = function ()
{
    return (this._xscale);
};
MCP.set_yscale2 = function (v)
{
    this.setPropRel("_yscale", v);
};
MCP.get_yscale2 = function ()
{
    return (this._yscale);
};
MCP.set_rotation2 = function (v)
{
    this.setPropRel("_rotation", v);
};
MCP.get_rotation2 = function ()
{
    return (this._rotation);
};
MCP.get_xmouse2 = function ()
{
    return (this._xmouse - this._xreg);
};
MCP.get_ymouse2 = function ()
{
    return (this._ymouse - this._yreg);
};
with (MCP)
{
    addProperty("_x2", get_x2, set_x2);
    addProperty("_y2", get_y2, set_y2);
    addProperty("_xscale2", get_xscale2, set_xscale2);
    addProperty("_yscale2", get_yscale2, set_yscale2);
    addProperty("_rotation2", get_rotation2, set_rotation2);
    addProperty("_xmouse2", get_xmouse2, null);
    addProperty("_ymouse2", get_ymouse2, null);
} // End of with
ASSetPropFlags(MCP, null, 1);
delete MCP;
var currentTree = -1;
var a_alltree_status = Array(0, 0, 0);
var a_tree00_ppl_status = Array(0, 0, 0);
var a_tree01_ppl_status = Array(0, 0, 0);
var a_tree02_ppl_status = Array(0, 0, 0);
var a_tree00_ani_status = Array(-1, -1, -1);
var a_tree01_ani_status = Array(-1, -1, -1);
var a_tree02_ani_status = Array(-1, -1, -1);
var animating = 0;
var a_pplName = Array("man01", "woman01", "woman02");
var pplOffset = 5;
var a_man01_loc = Array(82.500000 + pplOffset, 280, 239.500000, 280, 394.500000 - pplOffset, 280, "", "", 247.500000, 280);
var a_woman01_loc = Array(147 + pplOffset, 292, 304, 292, 459 - pplOffset, 292, "", "", 312, 292);
var a_woman02_loc = Array(218 + pplOffset, 278, 375, 278, 530 - pplOffset, 278, "", "", 383, 278);
var flag_grow = 0;
var currentLeave = -1;
var flag_pplButActive = 0;
var flag_seedButActive = 1;
var a_loop = Array(4, 4, 5);
var t0_bNum = 0;
var t1_bNum = 0;
var t2_bNum = 0;
var countStep = 70;
var a_tree00_01_a1 = Array(["area1", 101, 104, 213, 104, 181, 104, 144, 100, 100, 100, 10 + random(60), "tree00.area1", ""]);
var a_tree00_01_a2 = Array(["area2", 102, 157, 184, 138, 116, 138, 79, 100, 100, 100, 10 + random(60), "tree00.area2", ""]);
var a_tree00_01_a3 = Array(["area3", 103, 210, 217, 227, 186, 227, 149, 100, 100, 100, 10 + random(60), "tree00.area3", ""]);
var a_tree00_02_a1 = Array(["area1sub1", 121, 95, 196, 95, 196, 95, 159, 100, 100, 100, 10 + random(60), "tree00.area1sub1", ""], ["area1sub2", 122, 104, 165, 104, 165, 104, 128, 100, 100, 100, 10 + random(60), "tree00.area1sub2", ""], ["area1sub3", 123, 59, 181, 59, 181, 59, 144, 100, 100, 100, 10 + random(60), "tree00.area1sub3", ""]);
var a_tree00_02_a2 = Array(["area2sub1", 141, 116, 151, 116, 151, 116, 114, 100, 100, 100, 10 + random(60), "tree00.area2sub1", ""], ["area2sub2", 142, 94, 150, 94, 150, 94, 113, 100, 100, 100, 10 + random(60), "tree00.area2sub2", ""], ["area2sub3", 143, 71, 151, 71, 151, 71, 114, 100, 100, 100, 10 + random(60), "tree00.area2sub3", ""], ["area2sub4", 144, 136, 138, 136, 138, 136, 101, 100, 100, 100, 10 + random(60), "tree00.area2sub4", ""], ["area2sub5", 145, 98, 138, 98, 138, 98, 101, 100, 100, 100, 10 + random(60), "tree00.area2sub5", ""], ["area2sub6", 146, 76, 122, 76, 122, 76, 85, 100, 100, 100, 10 + random(60), "tree00.area2sub6", ""], ["area2sub7", 147, 98, 108, 98, 108, 98, 71, 100, 100, 100, 10 + random(60), "tree00.area2sub7", ""]);
var a_tree00_02_a3 = Array(["area3sub1", 161, 170, 177, 170, 177, 170, 140, 100, 100, 100, 10 + random(60), "tree00.area3sub1", ""], ["area3sub2", 162, 144, 164, 144, 164, 144, 127, 100, 100, 100, 10 + random(60), "tree00.area3sub2", ""], ["area3sub3", 163, 175, 163, 175, 163, 175, 126, 100, 100, 100, 10 + random(60), "tree00.area3sub3", ""], ["area3sub4", 164, 202, 163, 202, 163, 202, 126, 100, 100, 100, 10 + random(60), "tree00.area3sub4", ""], ["area3sub5", 165, 246, 163, 246, 163, 246, 126, 100, 100, 100, 10 + random(60), "tree00.area3sub5", ""], ["area3sub6", 166, 155, 151, 155, 151, 155, 114, 100, 100, 100, 10 + random(60), "tree00.area3sub6", ""], ["area3sub7", 167, 220, 150, 220, 150, 220, 113, 100, 100, 100, 10 + random(60), "tree00.area3sub7", ""], ["area3sub8", 168, 173, 138, 173, 138, 173, 101, 100, 100, 100, 10 + random(60), "tree00.area3sub8", ""], ["area3sub9", 169, 221, 138, 221, 138, 221, 101, 100, 100, 100, 10 + random(60), "tree00.area3sub9", ""], ["area3sub10", 170, 205, 126, 205, 126, 205, 89, 100, 100, 100, 10 + random(60), "tree00.area3sub10", ""]);
var a_tree00_03_a1 = Array(["area1eff1", 181, 43, 133, 43, 133, 43, 133, 100, 100, 100, 10 + random(60), "tree00.area1eff1", ""], ["area1eff2", 182, 97, 173, 97, 173, 97, 173, 100, 100, 100, 10 + random(60), "tree00.area1eff2", ""]);
var a_tree00_03_a2 = Array(["area2eff1", 201, 49, 101, 49, 101, 49, 101, 100, 100, 100, 10 + random(60), "tree00.area2eff1", ""], ["area2eff2", 202, 120, 58, 120, 58, 120, 58, 100, 100, 100, 10 + random(60), "tree00.area2eff2", ""]);
var a_tree00_03_a3 = Array(["area3eff1", 221, 210, 176, 210, 176, 210, 176, 100, 100, 100, 10 + random(60), "tree00.area3eff1", ""], ["area3eff2", 222, 219, 78, 219, 78, 219, 78, 100, 100, 100, 10 + random(60), "tree00.area3eff2", ""]);
var a_tree00_b = Array(["t00_01", 11, 150, 260, 150, 223, 100, 0, 1, "tree00.branch.t00_01", ""], ["t00_02", 12, 150, 241, 150, 204, 87.300000, 0, 2, "tree00.branch.t00_02", ""], ["t00_03", 13, 150, 226, 150, 189, 72.800000, 0, 3, "tree00.branch.t00_03", ""], ["t00_04", 14, 150, 213, 150, 176, 61.100000, 0, 4, "tree00.branch.t00_04", ""], ["t00_05", 15, 144, 207, 144, 170, 40, 305, 5, "tree00.branch.t00_05", ""], ["t00_06", 16, 151.500000, 203, 151.500000, 166, 45, 9, 5, "tree00.branch.t00_06", ""], ["t00_07", 17, 156.500000, 201.500000, 156.500000, 164.500000, 48, 63, 5, "tree00.branch.t00_07", ""], ["t00_08", 18, 138, 203, 138, 166, 35, 305, 6, "tree00.branch.t00_08", ""], ["t00_09", 19, 152.700000, 195, 152.700000, 158, 40, 9, 6, "tree00.branch.t00_09", ""], ["t00_10", 20, 165, 197, 165, 160, 43, 63, 6, "tree00.branch.t00_10", ""], ["t00_11", 21, 133, 199.500000, 133, 162.500000, 30, 305, 7, "tree00.branch.t00_11", ""], ["t00_12", 22, 153.800000, 188, 153.800000, 151, 33, 9, 7, "tree00.branch.t00_12", ""], ["t00_13", 23, 172.500000, 193.500000, 172.500000, 156.500000, 40, 63, 7, "tree00.branch.t00_13", ""], ["t00_14", 24, 128.500000, 196, 128.500000, 159, 25, 305, 8, "tree00.branch.t00_14", ""], ["t00_15", 25, 154.800000, 182, 154.800000, 145, 30, 9, 8, "tree00.branch.t00_15", ""], ["t00_16", 26, 178.500000, 190.500000, 178.500000, 153.500000, 33, 63, 8, "tree00.branch.t00_16", ""], ["t00_17", 27, 155.600000, 176.800000, 155.600000, 139.800000, 25, 9, 9, "tree00.branch.t00_17", ""]);
var a_tree01_01_a1 = Array(["area1", 1101, 272, 210, 272, 181, 272, 146, 100, 100, 100, 10 + random(60), "tree01.area1", ""]);
var a_tree01_01_a2 = Array(["area2", 1102, 319, 184, 291, 116, 291, 81, 100, 100, 100, 10 + random(60), "tree01.area2", ""]);
var a_tree01_01_a3 = Array(["area3", 1103, 372, 216, 383, 185, 383, 150, 100, 100, 100, 10 + random(60), "tree01.area3", ""]);
var a_tree01_02_a1 = Array(["area1sub1", 1121, 257, 196, 257, 196, 257, 161, 100, 100, 100, 10 + random(60), "tree01.area1sub1", ""], ["area1sub2", 1122, 261, 166, 261, 166, 261, 131, 100, 100, 100, 10 + random(60), "tree01.area1sub2", ""], ["area1sub3", 1123, 228, 181, 228, 181, 228, 146, 100, 100, 100, 10 + random(60), "tree01.area1sub3", ""]);
var a_tree01_02_a2 = Array(["area2sub1", 1141, 289, 139, 289, 139, 289, 104, 100, 100, 100, 10 + random(60), "tree01.area2sub1", ""], ["area2sub2", 1142, 228, 167, 228, 167, 228, 132, 100, 100, 100, 10 + random(60), "tree01.area2sub2", ""], ["area2sub3", 1143, 206, 168, 206, 168, 206, 133, 100, 100, 100, 10 + random(60), "tree01.area2sub3", ""], ["area2sub4", 1144, 270, 154, 270, 154, 270, 119, 100, 100, 100, 10 + random(60), "tree01.area2sub4", ""], ["area2sub5", 1145, 232, 154, 232, 154, 232, 119, 100, 100, 100, 10 + random(60), "tree01.area2sub5", ""], ["area2sub6", 1146, 265, 139, 265, 139, 265, 104, 100, 100, 100, 10 + random(60), "tree01.area2sub6", ""], ["area2sub7", 1147, 241, 140, 241, 140, 241, 105, 100, 100, 100, 10 + random(60), "tree01.area2sub7", ""]);
var a_tree01_02_a3 = Array(["area3sub1", 1161, 322, 176, 322, 176, 322, 141, 100, 100, 100, 10 + random(60), "tree01.area3sub1", ""], ["area3sub2", 1162, 301, 163, 301, 163, 301, 128, 100, 100, 100, 10 + random(60), "tree01.area3sub2", ""], ["area3sub3", 1163, 337, 163, 337, 163, 337, 128, 100, 100, 100, 10 + random(60), "tree01.area3sub3", ""], ["area3sub4", 1164, 367, 163, 367, 163, 367, 128, 100, 100, 100, 10 + random(60), "tree01.area3sub4", ""], ["area3sub5", 1165, 414, 163, 414, 163, 414, 128, 100, 100, 100, 10 + random(60), "tree01.area3sub5", ""], ["area3sub6", 1166, 313, 151, 313, 151, 313, 116, 100, 100, 100, 10 + random(60), "tree01.area3sub6", ""], ["area3sub7", 1167, 384, 150, 384, 150, 384, 115, 100, 100, 100, 10 + random(60), "tree01.area3sub7", ""], ["area3sub8", 1168, 330, 137, 330, 137, 330, 102, 100, 100, 100, 10 + random(60), "tree01.area3sub8", ""], ["area3sub9", 1169, 383, 138, 383, 138, 383, 103, 100, 100, 100, 10 + random(60), "tree01.area3sub9", ""], ["area3sub10", 1170, 362, 125, 362, 125, 362, 90, 100, 100, 100, 10 + random(60), "tree01.area3sub10", ""]);
var a_tree01_03_a1 = Array(["area1eff2b", 1181, 252, 179, 252, 179, 252, 179, 100, 100, 100, 10 + random(60), "tree01.area1eff2b", ""], ["area1eff3", 1182, 215, 165, 215, 165, 215, 165, 100, 100, 100, 10 + random(60), "tree01.area1eff3", ""]);
var a_tree01_03_a2 = Array(["area2eff1", 1201, 204, 105, 204, 105, 204, 105, 100, 100, 100, 10 + random(60), "tree01.area2eff1", ""], ["area2eff2", 1202, 281, 57, 281, 57, 281, 57, 100, 100, 100, 10 + random(60), "tree01.area2eff2", ""]);
var a_tree01_03_a3 = Array(["area3eff1", 1221, 367, 179, 367, 179, 367, 179, 100, 100, 100, 10 + random(60), "tree01.area3eff1", ""], ["area3eff2", 1222, 374, 78, 374, 78, 374, 78, 100, 100, 100, 10 + random(60), "tree01.area3eff2", ""]);
var a_tree01_b = Array(["t01_01", 1011, 309, 260, 309, 223, 100, 0, 1, "tree01.branch.t01_01", ""], ["t01_02", 1012, 309, 241, 309, 204, 87.300000, 0, 2, "tree01.branch.t01_02", ""], ["t01_03", 1013, 309, 225, 309, 188, 72.800000, 0, 3, "tree01.branch.t01_03", ""], ["t01_04", 1014, 309, 212, 309, 175, 61.100000, 0, 4, "tree01.branch.t01_04", ""], ["t01_05", 1015, 302, 217, 302, 180, 40, 311, 5, "tree01.branch.t01_05", ""], ["t01_06", 1016, 314, 205, 314, 168, 48, 45, 5, "tree01.branch.t01_06", ""], ["t01_07", 1017, 296.600000, 212.200000, 296.600000, 175.200000, 35, 311, 6, "tree01.branch.t01_07", ""], ["t01_08", 1018, 320.500000, 198.500000, 320.500000, 161.500000, 43, 45, 6, "tree01.branch.t01_08", ""], ["t01_09", 1019, 293, 213, 293, 176, 25, 248, 7, "tree01.branch.t01_09", ""], ["t01_10", 1020, 291.800000, 208, 291.800000, 171, 30, 311, 7, "tree01.branch.t01_10", ""], ["t01_11", 1021, 294, 206, 294, 169, 28, 2, 7, "tree01.branch.t01_11", ""], ["t01_12", 1022, 319, 196.500000, 319, 159.500000, 25, 332, 7, "tree01.branch.t01_12", ""], ["t01_13", 1023, 326, 193, 326, 156, 38, 45, 7, "tree01.branch.t01_13", ""], ["t01_14", 1024, 325, 200, 325, 163, 35, 100, 7, "tree01.branch.t01_14", ""], ["t01_15", 1025, 289.200000, 214.600000, 289.200000, 177.600000, 20, 248, 8, "tree01.branch.t01_15", ""], ["t01_16", 1026, 287.600000, 204.300000, 287.600000, 167.300000, 27, 311, 8, "tree01.branch.t01_16", ""], ["t01_17", 1027, 294.200000, 201.200000, 294.200000, 164.200000, 23, 2, 8, "tree01.branch.t01_17", ""], ["t01_18", 1028, 317, 192.700000, 317, 155.700000, 20, 332, 8, "tree01.branch.t01_18", ""], ["t01_19", 1029, 331, 188, 331, 151, 33, 45, 8, "tree01.branch.t01_19", ""], ["t01_20", 1030, 331.300000, 201.100000, 331.300000, 164.100000, 30, 100, 8, "tree01.branch.t01_20", ""], ["t01_21", 1031, 286, 216, 286, 179, 16, 248, 9, "tree01.branch.t01_21", ""], ["t01_22", 1032, 294.400000, 197, 294.400000, 160, 20, 2, 9, "tree01.branch.t01_22", ""], ["t01_23", 1033, 315.400000, 189.700000, 315.400000, 152.700000, 17, 332, 9, "tree01.branch.t01_23", ""], ["t01_24", 1034, 294.600000, 193.400000, 294.600000, 156.400000, 17, 2, 10, "tree01.branch.t01_24", ""], ["t01_25", 1035, 314, 187, 314, 150, 15, 332, 10, "tree01.branch.t01_25", ""]);
var a_tree02_01_a1 = Array(["area1", 11101, 438, 193, 428, 148, 428, 111, 100, 100, 100, 10 + random(60), "tree02.area1", ""]);
var a_tree02_01_a2 = Array(["area2b", 11102, 396, 219, 402, 185, 383, 148, 100, 100, 100, 10 + random(60), "tree02.area2b", ""]);
var a_tree02_01_a3 = Array(["area3b", 11103, 528, 219, 535, 196, 535, 159, 100, 100, 100, 10 + random(60), "tree02.area3b", ""]);
var a_tree02_01_a4 = Array(["area4", 11104, 491, 192, 489, 135, 489, 98, 100, 100, 100, 10 + random(60), "tree02.area4", ""]);
var a_tree02_02_a1 = Array(["area1sub1", 11121, 381, 149, 381, 149, 381, 112, 100, 100, 100, 10 + random(60), "tree02.area1sub1", ""], ["area1sub2", 11122, 419, 134, 419, 134, 419, 97, 100, 100, 100, 10 + random(60), "tree02.area1sub2", ""], ["area1sub3", 11123, 433, 120, 433, 120, 433, 83, 100, 100, 100, 10 + random(60), "tree02.area1sub3", ""]);
var a_tree02_02_a2 = Array(["area2sub1", 11141, 383, 178, 383, 178, 364, 141, 100, 100, 100, 10 + random(60), "tree02.area2sub1", ""], ["area2sub2", 11142, 394, 164, 394, 164, 400, 126, 100, 100, 100, 10 + random(60), "tree02.area2sub2", ""], ["area2sub3", 11143, 359, 178, 359, 178, 355, 127, 100, 100, 100, 10 + random(60), "tree02.area2sub3", ""], ["area2sub4", 11144, 419, 164, 419, 164, 419, 127, 100, 100, 100, 10 + random(60), "tree02.area2sub4", ""], ["area2sub5", 11145, 406, 206, 406, 206, 406, 169, 100, 100, 100, 10 + random(60), "tree02.area2sub5", ""], ["area2sub6", 11146, 444, 164, 444, 164, 444, 127, 100, 100, 100, 10 + random(60), "tree02.area2sub6", ""], ["area2sub7", 11147, 370, 164, 370, 164, 378, 126, 100, 100, 100, 10 + random(60), "tree02.area2sub7", ""]);
var a_tree02_02_a3 = Array(["area3sub1", 11161, 467, 187, 467, 187, 467, 150, 100, 100, 100, 10 + random(60), "tree02.area3sub1", ""], ["area3sub2", 11162, 592, 188, 592, 188, 592, 151, 100, 100, 100, 10 + random(60), "tree02.area3sub2", ""], ["area3sub3", 11163, 529, 175, 529, 175, 529, 138, 100, 100, 100, 10 + random(60), "tree02.area3sub3", ""], ["area3sub4", 11164, 565, 188, 565, 188, 565, 151, 100, 100, 100, 10 + random(60), "tree02.area3sub4", ""], ["area3sub5", 11165, 582, 175, 582, 175, 582, 138, 100, 100, 100, 10 + random(60), "tree02.area3sub5", ""], ["area3sub6", 11166, 484, 175, 484, 175, 484, 138, 100, 100, 100, 10 + random(60), "tree02.area3sub6", ""], ["area3sub7", 11167, 554, 162, 554, 162, 554, 125, 100, 100, 100, 10 + random(60), "tree02.area3sub7", ""], ["area3sub8", 11168, 487, 162, 487, 162, 487, 125, 100, 100, 100, 10 + random(60), "tree02.area3sub8", ""], ["area3sub9", 11169, 503, 150, 503, 150, 503, 113, 100, 100, 100, 10 + random(60), "tree02.area3sub9", ""], ["area3sub10", 11170, 543, 149, 543, 149, 543, 112, 100, 100, 100, 10 + random(60), "tree02.area3sub10", ""]);
var a_tree02_02_a4 = Array(["area4sub1", 11181, 478, 120, 478, 120, 478, 83, 100, 100, 100, 10 + random(60), "tree02.area4sub1", ""], ["area4sub2", 11182, 515, 120, 515, 120, 515, 83, 100, 100, 100, 10 + random(60), "tree02.area4sub2", ""], ["area4sub3", 11183, 455, 135, 455, 135, 455, 98, 100, 100, 100, 10 + random(60), "tree02.area4sub3", ""], ["area4sub4", 11184, 534, 135, 534, 135, 534, 98, 100, 100, 100, 10 + random(60), "tree02.area4sub4", ""], ["area4sub5", 11185, 467, 150, 467, 150, 467, 113, 100, 100, 100, 10 + random(60), "tree02.area4sub5", ""]);
var a_tree02_03_a1 = Array(["area1eff1", 11201, 358, 102, 358, 102, 358, 102, 100, 100, 100, 10 + random(60), "tree02.area1eff1", ""], ["area1eff2", 11202, 377, 82, 377, 82, 377, 82, 100, 100, 100, 10 + random(60), "tree02.area1eff2", ""]);
var a_tree02_03_a2 = Array(["area2eff1", 11221, 355, 169, 355, 169, 355, 169, 100, 100, 100, 10 + random(60), "tree02.area2eff1", ""], ["area2eff2", 11222, 420, 182, 420, 182, 420, 182, 100, 100, 100, 10 + random(60), "tree02.area2eff2", ""]);
var a_tree02_03_a3 = Array(["area3eff1", 11241, 604, 105, 604, 105, 604, 105, 100, 100, 100, 10 + random(60), "tree02.area3eff1", ""], ["area3eff2", 11242, 517, 182, 517, 182, 517, 182, 100, 100, 100, 10 + random(60), "tree02.area3eff2", ""]);
var a_tree02_03_a4 = Array(["area4eff1", 11261, 488, 61, 488, 61, 488, 61, 100, 100, 100, 10 + random(60), "tree02.area4eff1", ""], ["area4eff2", 11262, 556, 69, 556, 69, 556, 69, 100, 100, 100, 10 + random(60), "tree02.area4eff2", ""], ["area4eff3", 11263, 567, 84, 567, 84, 567, 84, 100, 100, 100, 10 + random(60), "tree02.area4eff3", ""]);
var a_tree02_b = Array(["t02_01", 11011, 462, 260, 462, 222, 100, 0, 1, "tree02.branch.t02_01", ""], ["t02_02", 11012, 462, 241, 462, 203, 87.300000, 0, 2, "tree02.branch.t02_02", ""], ["t02_03", 11013, 462, 225, 462, 187, 72.800000, 0, 3, "tree02.branch.t02_03", ""], ["t02_04", 11014, 462, 212, 462, 174, 61.100000, 0, 4, "tree02.branch.t02_04", ""], ["t02_05", 11015, 454, 205.500000, 454, 167.500000, 45, 305, 5, "tree02.branch.t02_05", ""], ["t02_06", 11016, 462, 206, 462, 168, 42, 337, 5, "tree02.branch.t02_06", ""], ["t02_07", 11017, 468.500000, 217, 468.500000, 179, 50, 45, 5, "tree02.branch.t02_07", ""], ["t02_08", 11018, 448, 201, 448, 163, 35, 305, 6, "tree02.branch.t02_08", ""], ["t02_09", 11019, 459, 199, 459, 161, 37, 337, 6, "tree02.branch.t02_09", ""], ["t02_10", 11020, 475, 210.300000, 475, 172.300000, 45, 45, 6, "tree02.branch.t02_10", ""], ["t02_11", 11021, 445.300000, 202.400000, 445.300000, 164.400000, 25, 242, 7, "tree02.branch.t02_11", ""], ["t02_12", 11022, 442.700000, 197.300000, 442.700000, 159.300000, 32, 305, 7, "tree02.branch.t02_12", ""], ["t02_13", 11023, 445, 196, 445, 158, 30, 335, 7, "tree02.branch.t02_13", ""], ["t02_14", 11024, 456.500000, 193, 456.500000, 155, 32, 337, 7, "tree02.branch.t02_14", ""], ["t02_15", 11025, 477.500000, 204, 477.500000, 166, 30, 0, 7, "tree02.branch.t02_15", ""], ["t02_16", 11026, 481, 204.400000, 481, 166.400000, 40, 45, 7, "tree02.branch.t02_16", ""], ["t02_17", 11027, 479, 211.500000, 479, 173.500000, 35, 100, 7, "tree02.branch.t02_17", ""], ["t02_18", 11028, 441.500000, 204.400000, 441.500000, 166.400000, 20, 242, 8, "tree02.branch.t02_18", ""], ["t02_19", 11029, 438, 194, 438, 156, 27, 305, 8, "tree02.branch.t02_19", ""], ["t02_20", 11030, 442.700000, 191.200000, 442.700000, 153.200000, 25, 335, 8, "tree02.branch.t02_20", ""], ["t02_21", 11031, 454.400000, 188, 454.400000, 150, 27, 337, 8, "tree02.branch.t02_21", ""], ["t02_22", 11032, 477.500000, 198.500000, 477.500000, 160.500000, 25, 0, 8, "tree02.branch.t02_22", ""], ["t02_23", 11033, 438.400000, 206.200000, 438.400000, 168.200000, 18, 242, 9, "tree02.branch.t02_23", ""], ["t02_24", 11034, 440.700000, 187.200000, 440.700000, 149.200000, 22, 335, 9, "tree02.branch.t02_24", ""], ["t02_25", 11035, 477.500000, 194, 477.500000, 156, 22, 0, 9, "tree02.branch.t02_25", ""], ["t02_26", 11036, 435.600000, 207.700000, 435.600000, 169.700000, 15, 242, 10, "tree02.branch.t02_26", ""], ["t02_27", 11037, 439, 185, 439, 147, 19, 335, 10, "tree02.branch.t02_27", ""], ["t02_28", 11038, 477.500000, 190, 477.500000, 152, 19, 0, 10, "tree02.branch.t02_28", ""]);
getURL("FSCommand:showmenu", false);
for (i = 0; i < 3; i++)
{
    createEmptyMovieClip("tree0" + i, i + 1);
    setProperty(_root["tree0" + i], _x, 0);
    setProperty(_root["tree0" + i], _y, 0);
} // end of for
var i = 0;
while (i < 3)
{
    _root["seed0" + i]._alpha = 100;
    _root["seedling0" + i]._alpha = 0;
    ++i;
} // end while
setRP2();
tree00._x = tree00._x + pplOffset;
tree02._x = tree02._x - pplOffset;
attachClickMe();
invisiblePplClickMe();
_root.onEnterFrame = function ()
{
    if (currentTree == 0)
    {
        if (a_alltree_status[currentTree] == 1)
        {
            if (a_tree00_ani_status[a_alltree_status[currentTree] - 1] == 0 && animating == 0)
            {
                _root["seedOff0" + currentTree + "ID"] = setInterval(seedOff, 25, currentTree);
                animating = 1;
                flag_pplButActive = 0;
            } // end if
            if (a_tree00_ani_status[a_alltree_status[currentTree] - 1] == 1 && animating == 0)
            {
                _root["seedlingOn0" + currentTree + "ID"] = setInterval(seedlingOn, 25, currentTree);
                generateLeaf();
                setAnimateLeaf();
                countAnimateID = setInterval(countAnimate, 10);
                animating = 1;
            } // end if
            if (a_tree00_ani_status[a_alltree_status[currentTree] - 1] == 4 && animating == 1)
            {
                animating = 0;
                flag_pplButActive = 1;
                refresh_ppl_status();
                visiblePplClickMe();
            } // end if
        } // end if
        if (a_alltree_status[currentTree] == 2)
        {
            if (a_tree00_ani_status[a_alltree_status[currentTree] - 1] == 0 && animating == 0)
            {
                _root["seedlingOff0" + currentTree + "ID"] = setInterval(seedlingOff, 25, currentTree);
                animating = 1;
                flag_pplButActive = 0;
            } // end if
            if (a_tree00_ani_status[a_alltree_status[currentTree] - 1] == 1 && animating == 0)
            {
                createBranchMC();
                generateBranch(0);
                animateOldLeaf(currentTree, 1, "");
                animating = 1;
            } // end if
            if (a_tree00_ani_status[a_alltree_status[currentTree] - 1] == 4 && animating == 0)
            {
                generateLeaf();
                setAnimateLeaf();
                countAnimateID = setInterval(countAnimate, 10);
                animating = 1;
            } // end if
            if (a_tree00_ani_status[a_alltree_status[currentTree] - 1] == 6 && animating == 1)
            {
                animating = 0;
                flag_pplButActive = 1;
                refresh_ppl_status();
                visiblePplClickMe();
            } // end if
        } // end if
        if (a_alltree_status[currentTree] == 3)
        {
            if (a_tree00_ani_status[a_alltree_status[currentTree] - 1] == 0 && animating == 0)
            {
                _root["moveBranch0" + currentTree + "ID"] = setInterval(moveBranch, 10);
                animateOldLeaf(currentTree, 1, "");
                animateOldLeaf(currentTree, 2, "");
                animating = 1;
            } // end if
            if (a_tree00_ani_status[a_alltree_status[currentTree] - 1] == 3 && animating == 0)
            {
                generateLeaf();
                setAnimateLeaf();
                countAnimateID = setInterval(countAnimate, 10);
                animating = 1;
            } // end if
            if (a_tree00_ani_status[a_alltree_status[currentTree] - 1] == 5 && animating == 1)
            {
                animating = 0;
                flag_pplButActive = 1;
                flag_seedButActive = 1;
                refresh_ppl_status();
                visibleSeedClickMe();
            } // end if
        } // end if
    } // end if
    if (currentTree == 1)
    {
        if (a_alltree_status[currentTree] == 1)
        {
            if (a_tree01_ani_status[a_alltree_status[currentTree] - 1] == 0 && animating == 0)
            {
                _root["seedOff0" + currentTree + "ID"] = setInterval(seedOff, 25, currentTree);
                animating = 1;
                flag_pplButActive = 0;
            } // end if
            if (a_tree01_ani_status[a_alltree_status[currentTree] - 1] == 1 && animating == 0)
            {
                _root["seedlingOn0" + currentTree + "ID"] = setInterval(seedlingOn, 25, currentTree);
                generateLeaf();
                setAnimateLeaf();
                countAnimateID = setInterval(countAnimate, 10);
                animating = 1;
            } // end if
            if (a_tree01_ani_status[a_alltree_status[currentTree] - 1] == 4 && animating == 1)
            {
                animating = 0;
                flag_pplButActive = 1;
                refresh_ppl_status();
                visiblePplClickMe();
            } // end if
        } // end if
        if (a_alltree_status[currentTree] == 2)
        {
            if (a_tree01_ani_status[a_alltree_status[currentTree] - 1] == 0 && animating == 0)
            {
                _root["seedlingOff0" + currentTree + "ID"] = setInterval(seedlingOff, 25, currentTree);
                animating = 1;
                flag_pplButActive = 0;
            } // end if
            if (a_tree01_ani_status[a_alltree_status[currentTree] - 1] == 1 && animating == 0)
            {
                createBranchMC();
                generateBranch(0);
                animateOldLeaf(currentTree, 1, "");
                animating = 1;
            } // end if
            if (a_tree01_ani_status[a_alltree_status[currentTree] - 1] == 4 && animating == 0)
            {
                generateLeaf();
                setAnimateLeaf();
                countAnimateID = setInterval(countAnimate, 10);
                animating = 1;
            } // end if
            if (a_tree01_ani_status[a_alltree_status[currentTree] - 1] == 6 && animating == 1)
            {
                animating = 0;
                flag_pplButActive = 1;
                refresh_ppl_status();
                visiblePplClickMe();
            } // end if
        } // end if
        if (a_alltree_status[currentTree] == 3)
        {
            if (a_tree01_ani_status[a_alltree_status[currentTree] - 1] == 0 && animating == 0)
            {
                _root["moveBranch0" + currentTree + "ID"] = setInterval(moveBranch, 10);
                animateOldLeaf(currentTree, 1, "");
                animateOldLeaf(currentTree, 2, "");
                animating = 1;
            } // end if
            if (a_tree01_ani_status[a_alltree_status[currentTree] - 1] == 3 && animating == 0)
            {
                generateLeaf();
                setAnimateLeaf();
                countAnimateID = setInterval(countAnimate, 10);
                animating = 1;
            } // end if
            if (a_tree01_ani_status[a_alltree_status[currentTree] - 1] == 5 && animating == 1)
            {
                animating = 0;
                flag_pplButActive = 1;
                flag_seedButActive = 1;
                refresh_ppl_status();
                visibleSeedClickMe();
            } // end if
        } // end if
    } // end if
    if (currentTree == 2)
    {
        if (a_alltree_status[currentTree] == 1)
        {
            if (a_tree02_ani_status[a_alltree_status[currentTree] - 1] == 0 && animating == 0)
            {
                _root["seedOff0" + currentTree + "ID"] = setInterval(seedOff, 25, currentTree);
                animating = 1;
                flag_pplButActive = 0;
            } // end if
            if (a_tree02_ani_status[a_alltree_status[currentTree] - 1] == 1 && animating == 0)
            {
                _root["seedlingOn0" + currentTree + "ID"] = setInterval(seedlingOn, 25, currentTree);
                generateLeaf();
                setAnimateLeaf();
                countAnimateID = setInterval(countAnimate, 10);
                animating = 1;
            } // end if
            if (a_tree02_ani_status[a_alltree_status[currentTree] - 1] == 4 && animating == 1)
            {
                animating = 0;
                flag_pplButActive = 1;
                refresh_ppl_status();
                visiblePplClickMe();
            } // end if
        } // end if
        if (a_alltree_status[currentTree] == 2)
        {
            if (a_tree02_ani_status[a_alltree_status[currentTree] - 1] == 0 && animating == 0)
            {
                _root["seedlingOff0" + currentTree + "ID"] = setInterval(seedlingOff, 25, currentTree);
                animating = 1;
                flag_pplButActive = 0;
            } // end if
            if (a_tree02_ani_status[a_alltree_status[currentTree] - 1] == 1 && animating == 0)
            {
                createBranchMC();
                generateBranch(0);
                animateOldLeaf(currentTree, 1, "");
                animating = 1;
            } // end if
            if (a_tree02_ani_status[a_alltree_status[currentTree] - 1] == 4 && animating == 0)
            {
                generateLeaf();
                setAnimateLeaf();
                countAnimateID = setInterval(countAnimate, 10);
                animating = 1;
            } // end if
            if (a_tree02_ani_status[a_alltree_status[currentTree] - 1] == 6 && animating == 1)
            {
                animating = 0;
                flag_pplButActive = 1;
                refresh_ppl_status();
                visiblePplClickMe();
            } // end if
        } // end if
        if (a_alltree_status[currentTree] == 3)
        {
            if (a_tree02_ani_status[a_alltree_status[currentTree] - 1] == 0 && animating == 0)
            {
                _root["moveBranch0" + currentTree + "ID"] = setInterval(moveBranch, 10);
                animateOldLeaf(currentTree, 1, "");
                animateOldLeaf(currentTree, 2, "");
                animating = 1;
            } // end if
            if (a_tree02_ani_status[a_alltree_status[currentTree] - 1] == 3 && animating == 0)
            {
                generateLeaf();
                setAnimateLeaf();
                countAnimateID = setInterval(countAnimate, 10);
                animating = 1;
            } // end if
            if (a_tree02_ani_status[a_alltree_status[currentTree] - 1] == 5 && animating == 1)
            {
                animating = 0;
                flag_pplButActive = 1;
                flag_seedButActive = 1;
                refresh_ppl_status();
                visibleSeedClickMe();
            } // end if
        } // end if
    } // end if
};
treeBut00.onRollOver = treeBut01.onRollOver = treeBut02.onRollOver = function ()
{
    if (_root.flag_seedButActive == 0)
    {
        this.useHandCursor = false;
    }
    else
    {
        this.useHandCursor = true;
    } // end else if
};
treeBut00.onRelease = treeBut00.onReleaseOutside = function ()
{
    if (_root.currentTree != 0 && _root.flag_seedButActive == 1)
    {
        _root.currentTree = 0;
        _root.flag_pplButActive = 0;
        invisibleSeedClickMe();
        if (a_alltree_status[currentTree] < 3)
        {
            _root.flag_seedButActive = 0;
        } // end if
        pplReactivate();
        clearInterval(peopleWalkID);
        peopleWalkID = setInterval(peopleWalk, 10, 0);
        clickTree00();
    } // end if
};
treeBut01.onRelease = treeBut01.onReleaseOutside = function ()
{
    if (_root.currentTree != 1 && _root.flag_seedButActive == 1)
    {
        _root.currentTree = 1;
        _root.flag_pplButActive = 0;
        invisibleSeedClickMe();
        if (a_alltree_status[currentTree] < 3)
        {
            _root.flag_seedButActive = 0;
        } // end if
        pplReactivate();
        clearInterval(peopleWalkID);
        peopleWalkID = setInterval(peopleWalk, 10, 1);
        clickTree01();
    } // end if
};
treeBut02.onRelease = treeBut02.onReleaseOutside = function ()
{
    if (_root.currentTree != 2 && _root.flag_seedButActive == 1)
    {
        _root.currentTree = 2;
        _root.flag_pplButActive = 0;
        invisibleSeedClickMe();
        if (a_alltree_status[currentTree] < 3)
        {
            _root.flag_seedButActive = 0;
        } // end if
        pplReactivate();
        clearInterval(peopleWalkID);
        peopleWalkID = setInterval(peopleWalk, 10, 2);
        clickTree02();
    } // end if
};
man01.onRollOver = function ()
{
    if (_root.flag_pplButActive == 0 | _root["a_tree0" + currentTree + "_ppl_status"][0] == 1 | _root.a_alltree_status[_root.currentTree] >= 3)
    {
        this.useHandCursor = false;
    }
    else
    {
        this.useHandCursor = true;
        this.shadow.gotoAndStop(3);
    } // end else if
};
woman01.onRollOver = function ()
{
    if (_root.flag_pplButActive == 0 | _root["a_tree0" + currentTree + "_ppl_status"][1] == 1 | _root.a_alltree_status[_root.currentTree] >= 3)
    {
        this.useHandCursor = false;
    }
    else
    {
        this.useHandCursor = true;
        this.shadow.gotoAndStop(4);
    } // end else if
};
woman02.onRollOver = function ()
{
    if (_root.flag_pplButActive == 0 | _root["a_tree0" + currentTree + "_ppl_status"][2] == 1 | _root.a_alltree_status[_root.currentTree] >= 3)
    {
        this.useHandCursor = false;
    }
    else
    {
        this.useHandCursor = true;
        this.shadow.gotoAndStop(2);
    } // end else if
};
man01.onRollOut = man01.onDragOut = woman01.onRollOut = woman01.onDragOut = woman02.onRollOut = woman02.onDragOut = function ()
{
    this.shadow.gotoAndStop(1);
};
man01.onRelease = man01.onReleaseOutside = function ()
{
    if (_root.flag_pplButActive == 1 && _root.a_alltree_status[_root.currentTree] < 3)
    {
        if (_root["a_tree0" + currentTree + "_ppl_status"][0] == 0)
        {
            _root.woman01.stop();
            _root.woman02.stop();
            this.gotoAndPlay(1);
            ++_root["a_tree0" + currentTree + "_ppl_status"][0];
            ++_root.a_alltree_status[_root.currentTree];
            invisiblePplClickMe();
            if (_root.a_alltree_status[_root.currentTree] == 1)
            {
                ++_root["a_tree0" + currentTree + "_ani_status"][a_alltree_status[currentTree] - 1];
            }
            else if (_root.a_alltree_status[_root.currentTree] == 2)
            {
                ++_root["a_tree0" + currentTree + "_ani_status"][a_alltree_status[currentTree] - 1];
            }
            else if (_root.a_alltree_status[_root.currentTree] == 3)
            {
                ++_root["a_tree0" + currentTree + "_ani_status"][a_alltree_status[currentTree] - 1];
            } // end if
        } // end else if
    } // end else if
};
woman01.onRelease = woman01.onReleaseOutside = function ()
{
    if (_root.flag_pplButActive == 1 && _root.a_alltree_status[_root.currentTree] < 3)
    {
        if (_root["a_tree0" + currentTree + "_ppl_status"][1] == 0)
        {
            _root.man01.stop();
            _root.woman02.stop();
            this.gotoAndPlay(1);
            ++_root["a_tree0" + currentTree + "_ppl_status"][1];
            ++_root.a_alltree_status[_root.currentTree];
            invisiblePplClickMe();
            if (_root.a_alltree_status[_root.currentTree] == 1)
            {
                ++_root["a_tree0" + currentTree + "_ani_status"][a_alltree_status[currentTree] - 1];
            }
            else if (_root.a_alltree_status[_root.currentTree] == 2)
            {
                ++_root["a_tree0" + currentTree + "_ani_status"][a_alltree_status[currentTree] - 1];
            }
            else if (_root.a_alltree_status[_root.currentTree] == 3)
            {
                ++_root["a_tree0" + currentTree + "_ani_status"][a_alltree_status[currentTree] - 1];
            } // end if
        } // end else if
    } // end else if
};
woman02.onRelease = woman02.onReleaseOutside = function ()
{
    if (_root.flag_pplButActive == 1 && _root.a_alltree_status[_root.currentTree] < 3)
    {
        if (_root["a_tree0" + currentTree + "_ppl_status"][2] == 0)
        {
            _root.man01.stop();
            _root.woman01.stop();
            this.gotoAndPlay(1);
            ++_root["a_tree0" + currentTree + "_ppl_status"][2];
            ++_root.a_alltree_status[_root.currentTree];
            invisiblePplClickMe();
            if (_root.a_alltree_status[_root.currentTree] == 1)
            {
                ++_root["a_tree0" + currentTree + "_ani_status"][a_alltree_status[currentTree] - 1];
            }
            else if (_root.a_alltree_status[_root.currentTree] == 2)
            {
                ++_root["a_tree0" + currentTree + "_ani_status"][a_alltree_status[currentTree] - 1];
            }
            else if (_root.a_alltree_status[_root.currentTree] == 3)
            {
                ++_root["a_tree0" + currentTree + "_ani_status"][a_alltree_status[currentTree] - 1];
            } // end if
        } // end else if
    } // end else if
};
