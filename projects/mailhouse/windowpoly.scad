module window(width, height, depth=2)
{
    aspect = height / width;
    x = width / 2;
    y = height / 2;
    z = depth / 2;

    middle_plane = 0;

    offset = width * 0.1;
    padding = width * 0.05;
    x2 = x - offset;
    y2 = y - offset;
    
    //difference() {
        polyhedron(
          points=[       
            [x2,y2,middle_plane],
            [x2,-y2,middle_plane],
            [-x2,-y2,middle_plane],
            [-x2,y2,middle_plane],

            [x,y,z],
            [x,-y,z],
            [-x,-y,z],
            [-x,y,z],
            
            [x,y,-z],
            [x,-y,-z],
            [-x,-y,-z],
            [-x,y,-z]
          ],                               
          faces=[
            //slant sides
            [0,1,5,4],
            [1,2,6,5],
            [2,3,7,6],
            [3,0,4,7],
            
            //sides
            [4,5,9,8],
            [5,6,10,9],
            [6,7,11,10],
            [7,4,8,11],
            
            //top and bottom
            [0,1,2,3],
            //[4,5,6,7]
            [8,9,10,11]
          ]
        );
        translate([0,-(y/2),2]) cube([width - (offset * 2) - (padding * 2),y-offset-(padding * 2),1], center=true);
        translate([0,(y/2)+padding,2]) cube([width - (offset * 2) - (padding * 2),20,1], center=true);
    //}
}
window(60,87);