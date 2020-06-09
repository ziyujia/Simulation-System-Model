# Simulation-System-Model

We realize many simulation system models to create coupled time series.

# Method

## Henon map

![](https://github.com/ziyujia/Simulation-System-Model/blob/master/Images/HenonMap.png?raw=true)

```
function xM = aleCoupledhenonmaps2(m,c,n,noise,aV,x0M)
```

- m : the number of coupled maps (time series)
- c : the coupling strength
- n : the time series length
- noise : noise to add
- aV : the two parameters in a vector (if omitted the standard parameters for chaos are chosen)
- x0M : initial conditions, a matrix of size 2 x m

- xM : the n x m matrix of the generated time series

## ChaotiMap

![](https://github.com/ziyujia/Simulation-System-Model/blob/master/Images/ChaotiMap.png?raw=true)

```
function data = multichaoticmap(n,c,s,eps,mu)
```

- eps : 1 logistica  eps=0 tenda mu in [0,2]
- mu : default 1.8 
- c : square matrix  
- n : the time series length
- s : gaussian noise



## Lorenz

![](https://github.com/ziyujia/Simulation-System-Model/blob/master/Images/Lorenz.png?raw=true)

```
function xM = coupledKLorenz(n,K,ts,epsilonV)
```

- n : time series length
- K : number of Lorenz subsystems to be coupled
- ts : sampling time (best to use 0.05)
- epsilonV : vector of coupling strengths of length K-1, in simulations, we use the same coupling strength epsilon
- xM : matrix (n x K) of the X-variables from each Lorenz subsystem

## Lattice

![](https://github.com/ziyujia/Simulation-System-Model/blob/master/Images/Lattice.png?raw=true)

```
function xM = lattice(m,c,n,x0M)
```

- m : the number of coupled maps (time series)
- c : the coupling strength
- n : the time series length
- x0M : initial conditions
- xM : the matrix of the generated time series

## Logistic

![](https://github.com/ziyujia/Simulation-System-Model/blob/master/Images/Logistic.png?raw=true)

```
function xM = logistic(m,c,n,noise,aV,x0M)
```

- m : the number of coupled maps (time series)
- c : the coupling strength
- n : the time series length
- noise : noise to add
- aV : the two parameters in a vector 
- x0M : initial conditions
- xM : the matrix of the generated time series

## Mackey

![](https://github.com/ziyujia/Simulation-System-Model/blob/master/Images/Mackey.png?raw=true)

```
function xM = Mackey(n)
```

- n : the time series length
- xM : the  matrix of the generated time series

## Linear

### linear42

![Linear42.png](https://github.com/ziyujia/Simulation-System-Model/blob/master/Images/Linear42.png?raw=true)

```
function [data] = linear42(N,settleTime)
```

- N : number of points of simulated time series
- settleTime : settling time

### linear45

![Linear42.png](https://github.com/ziyujia/Simulation-System-Model/blob/master/Images/Linear45.png?raw=true)

```
function [data] = linear45(N,settleTime)
```

- N : number of points of simulated time series
- settleTime : settling time

### linear54

![Linear42.png](https://github.com/ziyujia/Simulation-System-Model/blob/master/Images/Linear54.png?raw=true)

```
function [data] = linear54(N,settleTime)
```

- N : number of points of simulated time series
- settleTime : settling time

## Nonlinear

### Nonlinear31

![Linear42.png](https://github.com/ziyujia/Simulation-System-Model/blob/master/Images/Nonlinear31.png?raw=true)

```
function [data] = nonlinear31(N,settleTime)
```

- N : number of points of simulated time series
- settleTime : settling time

### Nonlinear45

![Linear42.png](https://github.com/ziyujia/Simulation-System-Model/blob/master/Images/Nonlinear45.png?raw=true)

```
function [data] = linear45(N,settleTime)
```

- N : number of points of simulated time series
- settleTime : settling time

### Nonlinear53

![Linear42.png](https://github.com/ziyujia/Simulation-System-Model/blob/master/Images/Nonlinear53.png?raw=true)

```
function [data] = nonlinear53(N,settleTime)
```

- N : number of points of simulated time series
- settleTime : settling time

# Licence

- the GNU General Public License

 