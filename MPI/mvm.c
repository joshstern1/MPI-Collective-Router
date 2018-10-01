#include <stdlib.h>
#include <stdio.h>
#include "mpi.h"

#define vsize 64
#define proc_per_row 8
#define blocksize vsize/proc_per_row

int main(int argc, char** argv) {

    MPI_Init(NULL, NULL);
    int rank, world_size;
    MPI_Comm_rank(MPI_COMM_WORLD, &rank);
    MPI_Comm_size(MPI_COMM_WORLD, &world_size);

    int color = rank / proc_per_row;
    int color2 = rank % proc_per_row;

    MPI_Comm row_comm, col_comm;
    MPI_Comm_split(MPI_COMM_WORLD, color, rank, &row_comm);
    MPI_Comm_split(MPI_COMM_WORLD, color2, rank, &col_comm);

    double a[vsize][vsize];
    double b[vsize];
    double c[vsize];
    double temp_a[blocksize][vsize];
    double work_a[blocksize][blocksize];
    double work_c[blocksize];
    double temp_c[blocksize];
    int i,j;

    if(rank==0){
      for(i=0;i<vsize;i++){
        for(j=0;j<vsize;j++){
          a[i][j] = i;
        }
      }
      for(i=0;i<vsize;i++){
        b[i] = 1;
      }
    }


    MPI_Barrier(MPI_COMM_WORLD);

    if(rank%proc_per_row==0){
      MPI_Scatter(a, vsize*blocksize, MPI_DOUBLE, temp_a, vsize*blocksize, MPI_DOUBLE, 0, col_comm);
    }


    for(i=0;i<vsize/proc_per_row;i++){
      MPI_Scatter(&temp_a[i][0], blocksize, MPI_DOUBLE, &work_a[i][0], blocksize, MPI_DOUBLE, 0, row_comm);
    }

    MPI_Bcast( b, vsize, MPI_DOUBLE, 0, MPI_COMM_WORLD);

    //computation
    for(i=0;i<blocksize;i++){
      work_c[i] = 0;
      for(j=0;j<blocksize;j++){
        work_c[i] += work_a[i][j] * b[j+(rank % proc_per_row)];
      }
    }

    MPI_Reduce(work_c, temp_c, blocksize, MPI_DOUBLE, MPI_SUM, 0, row_comm);
    MPI_Gather(temp_c, blocksize, MPI_DOUBLE, c, blocksize, MPI_DOUBLE, 0, col_comm);

    MPI_Barrier(MPI_COMM_WORLD);

    if(rank==0){
      printf("vector:\n");
      for(i=0;i<vsize;i++){
        printf("%f\n", c[i]);
      }
    }


    MPI_Finalize();
}
