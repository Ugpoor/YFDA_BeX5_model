//-------------------------------------------------------------------------------------------------------
// Copyright (C) Microsoft. All rights reserved.
// Licensed under the MIT license. See LICENSE.txt file in the project root for full license information.
//-------------------------------------------------------------------------------------------------------
package Windows.UI.Xaml.Controls;

import android.graphics.PointF;

public class BezierSegment extends PathSegment {
    PointF _point1;
    PointF _point2;
    PointF _point3;

    public PointF getPoint1() {
        return _point1;
    }
    public void setPoint1(PointF point1) {
        _point1 = point1;
    }

    public PointF getPoint2() {
        return _point2;
    }
    public void setPoint2(PointF point2) {
        _point2 = point2;
    }

    public PointF getPoint3() {
        return _point3;
    }
    public void setPoint3(PointF point3) {
        _point3 = point3;
    }
}
