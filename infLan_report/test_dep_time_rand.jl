using NonlinearEigenproblems, Random, SparseArrays, Revise, BenchmarkTools
import ..NEPSolver.ilan;
import ..NEPSolver.tiar;

include("../src/method_ilan.jl");
include("../src/method_tiar.jl");

Random.seed!(1) # reset the random seed

# random DEP
n=1000;
K = [1:n;2:n;1:n-1]; J=[1:n;1:n-1;2:n]; A1 = sparse(K, J, rand(3*n-2)); A1 = A1+A1'; A2 = sparse(K, J, rand(3*n-2)); A2 = A2+A2'; nep=DEP([A1,A2],[0,1])

mm=100
v0=rand(Float64,n)
@time begin ilan(Float64,nep;Neig=200,displaylevel=0,maxit=mm,tol=eps()*100,check_error_every=Inf,v=v0) end
@time begin tiar(Float64,nep;Neig=200,displaylevel=0,maxit=mm,tol=eps()*100,check_error_every=Inf,v=v0) end

mm=200
v0=rand(Float64,n)
@time begin ilan(Float64,nep;Neig=200,displaylevel=0,maxit=mm,tol=eps()*100,check_error_every=Inf,v=v0) end
@time begin tiar(Float64,nep;Neig=200,displaylevel=0,maxit=mm,tol=eps()*100,check_error_every=Inf,v=v0) end

mm=400
v0=rand(Float64,n)
@time begin ilan(Float64,nep;Neig=200,displaylevel=0,maxit=mm,tol=eps()*100,check_error_every=Inf,v=v0) end
@time begin tiar(Float64,nep;Neig=200,displaylevel=0,maxit=mm,tol=eps()*100,check_error_every=Inf,v=v0) end



# random DEP
n=10000;
K = [1:n;2:n;1:n-1]; J=[1:n;1:n-1;2:n]; A1 = sparse(K, J, rand(3*n-2)); A1 = A1+A1'; A2 = sparse(K, J, rand(3*n-2)); A2 = A2+A2'; nep=DEP([A1,A2],[0,1])

mm=100
v0=rand(Float64,n)
@time begin ilan(Float64,nep;Neig=200,displaylevel=0,maxit=mm,tol=eps()*100,check_error_every=Inf,v=v0) end
@time begin tiar(Float64,nep;Neig=200,displaylevel=0,maxit=mm,tol=eps()*100,check_error_every=Inf,v=v0) end

mm=200
v0=rand(Float64,n)
@time begin ilan(Float64,nep;Neig=200,displaylevel=0,maxit=mm,tol=eps()*100,check_error_every=Inf,v=v0) end
@time begin tiar(Float64,nep;Neig=200,displaylevel=0,maxit=mm,tol=eps()*100,check_error_every=Inf,v=v0) end

mm=400
v0=rand(Float64,n)
@time begin ilan(Float64,nep;Neig=200,displaylevel=0,maxit=mm,tol=eps()*100,check_error_every=Inf,v=v0) end
@time begin tiar(Float64,nep;Neig=200,displaylevel=0,maxit=mm,tol=eps()*100,check_error_every=Inf,v=v0) end



# random DEP
n=100000;
K = [1:n;2:n;1:n-1]; J=[1:n;1:n-1;2:n]; A1 = sparse(K, J, rand(3*n-2)); A1 = A1+A1'; A2 = sparse(K, J, rand(3*n-2)); A2 = A2+A2'; nep=DEP([A1,A2],[0,1])

mm=100
v0=rand(Float64,n)
@time begin ilan(Float64,nep;Neig=200,displaylevel=0,maxit=mm,tol=eps()*100,check_error_every=Inf,v=v0) end
@time begin tiar(Float64,nep;Neig=200,displaylevel=0,maxit=mm,tol=eps()*100,check_error_every=Inf,v=v0) end

mm=200
v0=rand(Float64,n)
@time begin ilan(Float64,nep;Neig=200,displaylevel=0,maxit=mm,tol=eps()*100,check_error_every=Inf,v=v0) end
@time begin tiar(Float64,nep;Neig=200,displaylevel=0,maxit=mm,tol=eps()*100,check_error_every=Inf,v=v0) end

mm=400
v0=rand(Float64,n)
@time begin ilan(Float64,nep;Neig=200,displaylevel=0,maxit=mm,tol=eps()*100,check_error_every=Inf,v=v0) end
@time begin tiar(Float64,nep;Neig=200,displaylevel=0,maxit=mm,tol=eps()*100,check_error_every=Inf,v=v0) end



# random DEP
n=1000000;
K = [1:n;2:n;1:n-1]; J=[1:n;1:n-1;2:n]; A1 = sparse(K, J, rand(3*n-2)); A1 = A1+A1'; A2 = sparse(K, J, rand(3*n-2)); A2 = A2+A2'; nep=DEP([A1,A2],[0,1])
mm=100
v0=rand(Float64,n)
@time begin ilan(Float64,nep;Neig=200,displaylevel=0,maxit=mm,tol=eps()*100,check_error_every=Inf,v=v0) end
@time begin tiar(Float64,nep;Neig=200,displaylevel=0,maxit=mm,tol=eps()*100,check_error_every=Inf,v=v0) end

mm=200
v0=rand(Float64,n)
@time begin ilan(Float64,nep;Neig=200,displaylevel=0,maxit=mm,tol=eps()*100,check_error_every=Inf,v=v0) end
@time begin tiar(Float64,nep;Neig=200,displaylevel=0,maxit=mm,tol=eps()*100,check_error_every=Inf,v=v0) end

mm=400
v0=rand(Float64,n)
@time begin ilan(Float64,nep;Neig=200,displaylevel=0,maxit=mm,tol=eps()*100,check_error_every=Inf,v=v0) end
@time begin tiar(Float64,nep;Neig=200,displaylevel=0,maxit=mm,tol=eps()*100,check_error_every=Inf,v=v0) end
