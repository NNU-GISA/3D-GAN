function [countvert, countfaces] = visualize(root, voxel_root, filename, category)

    meshpath = [root, category, filename, '.off']
    voxelpath = [voxel_root, category, filename, '.mat'];
    FV = load_off(meshpath);
    figure
    c = zeros(length(FV.vertices),1);
    %trisurf(FV.faces, FV.vertices(2:end,1), FV.vertices(2:end,2), FV.vertices(2:end,3));
    trisurf(FV.faces, FV.vertices(:,1), FV.vertices(:,2), FV.vertices(:,3));
    axis equal
    load(voxelpath); % will assign the wanted Volume variable
    figure
    patch(isosurface(Volume,0.1), 'Facecolor', [1 0 0]);
    axis equal

    none = 0;
    
    countvert = FV.vertices(1:end,:);
    countfaces = FV.faces;
    
end
