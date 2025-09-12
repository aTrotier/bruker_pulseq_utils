using KomaMRI, CairoMakie

seq = read_seq("../bruker_seq/out/bruker_gre.seq")

sys = Scanner()
obj = brain_phantom2D(;us=(1,2))

scale = 10
obj.x /= scale
obj.y /= scale
obj.z /= scale

# Define simulation parameters and perform simulation
sim_params = KomaMRICore.default_sim_params() 
raw = simulate(obj, seq, sys; sim_params)

raw.params["encodedSize"]
# Auxiliary function for reconstruction

acqData = AcquisitionData(raw)
acqData.encodingSize=(seq.DEF["Nx"],seq.DEF["Ny"])

acqData.traj[1].circular = false #Removing circular window
C = maximum(2*abs.(acqData.traj[1].nodes[:]))  #Normalize k-space to -.5 to .5 for NUFFT
acqData.traj[1].nodes = acqData.traj[1].nodes[1:2,:] ./ C

Nx, Ny = raw.params["reconSize"][1:2]
recParams = Dict{Symbol,Any}()
recParams[:reconSize] = (Nx, Ny)
recParams[:densityWeighting] = false
rec = reconstruction(acqData, recParams)
image3d  = reshape(rec.data, Nx, Ny, :)
image2d = (abs.(image3d) * prod(size(image3d)[1:2]))[:,:,2]


heatmap(image2d)