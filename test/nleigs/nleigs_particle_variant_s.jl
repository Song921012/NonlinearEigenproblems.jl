# Particle: variant S

#using NonlinearEigenproblemsTest
using NonlinearEigenproblems
using Test

include("particle_test_utils.jl")

@bench @testset "NLEIGS: Particle variant S" begin
    verbose = displaylevel

    nep, Σ, Ξ, v, nodes, xmin, xmax = particle_init(2)

    # solve nlep
    lambda, X, res, solution_info = nleigs(nep, Σ, Ξ=Ξ, logger=verbose > 0 ? 1 : 0, maxdgr=50, minit=120, maxit=200, v=v, nodes=nodes, static=true, return_details=verbose > 1)

    verify_lambdas(2, nep, lambda, X)

    if verbose > 1
        include("nleigs_residual_plot.jl")
        approx_Σ = [xmin-im*1e-10, xmin+im*1e-10, xmax+im*1e-10, xmax-im*1e-10]
        nleigs_residual_plot("Particle: variant S", solution_info, approx_Σ)
    end
end
