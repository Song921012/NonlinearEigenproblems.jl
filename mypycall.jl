using PyCall
pushfirst!(PyVector(pyimport("sys")["path"]), "")


local mynep
@pyimport mynep as mynep


using NonlinearEigenproblems
import NonlinearEigenproblems.size
import NonlinearEigenproblems.compute_Mlincomb;
import NonlinearEigenproblems.compute_Mder;


# Set up a dummy type for our specific NEP
struct PyNEP <: NEP
end
pnep=PyNEP();
size(::PyNEP) = (2,2)
size(::PyNEP,::Int) = 2
function compute_Mder(::PyNEP,s::Number,der::Integer=0)
    if (der>0)
        error("Higher derivatives not implemented");
    end
    return mynep.compute_M(complex(s)); # Call python
end
function compute_Mlincomb(::PyNEP,s::Number,X::AbstractVecOrMat)
    XX=complex(reshape(X,size(X,1),size(X,2))) # Turn into a matrix
    return mynep.compute_Mlincomb(complex(s),XX); # Call python
end
# Check that they work
@show compute_Mder(pnep,3+3im)



(λv,vv)=iar(pnep,v=[1;1],σ=1,displaylevel=1,Neig=3);

λ=λv[1];
v=vv[:,1]
A=[1 2 ; 3 4];
B=[0 0 ; 0 1];
C=[1 1 ; 1 1];
r=A*v+λ*B*v+exp(λ)*C*v;
@show r
