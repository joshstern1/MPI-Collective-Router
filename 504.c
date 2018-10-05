// Copyright 2018 Joshua Stern jstern19@bu.edu
//
//// The goal is to implement a max-heap priority queue base ...
#include <stdio.h>
#include <stdlib.h>
#include <string.h> /* need this for string manipulation */
#include <time.h>   /* need this for simple timers */


#define NIL NULL

// This is used to disable silly errors with standard library functions in visual studio
#pragma warning(disable:4996)

clock_t clock(void);

static char tab = '\t';
static char cr = '\r';
static char lf = '\n';
static char es = '\0';
FILE *fp_out;
//
///* Type definitions */
//
typedef struct Node Data_Node;
typedef struct Node {
        int code;
        char zip[12];
        char city[150];
        char state[6];
} *NodePtr;

/* Global variables*/

#define MAX_CITIES 10000

static Data_Node* cityHeap[MAX_CITIES];
static int heapSize = 0;

void upHeap(int new_pos)   // Max_heap
{

        int k = new_pos;
        while(k>0){
                int key = cityHeap[k]->code;
                int pval = -1;
                if(((k-1)/2)>=0){
                        pval = cityHeap[(k-1)/2]->code;
                }
                if(key>pval){
                        NodePtr temp = cityHeap[k];
                        cityHeap[k] = cityHeap[(k-1)/2];
                        cityHeap[(k-1)/2] = temp;
                        k = (k-1)/2;
                }
                else{
                        break;
                }
        }

   return ;
   // Upheap from position new_pos

}


void downHeap(int root) // do for max heap
{

        int k = root;
        while(k<heapSize){
                int key = cityHeap[k]->code;
                int lval = -1;
                int rval = -1;
                if((2*k+1)<heapSize){
                        lval = cityHeap[2*k+1]->code;
                }
                if((2*k+2)<heapSize){
                        rval = cityHeap[2*k+2]->code;
                }
                if((lval>=rval)&&(lval>key)){
                        //printf("before: cityHeap[k]->code = %d, cityHeap[2k+1]->code = %d\n", cityHeap[k]->code, cityHeap[2*k+1]->code);
                        NodePtr temp = cityHeap[k];
                        cityHeap[k] = cityHeap[2*k+1];
                        cityHeap[2*k+1] = temp;
                        //printf("after: cityHeap[k]->code = %d, cityHeap[2k+1]->code = %d\n", cityHeap[k]->code, cityHeap[2*k+1]->code);
                        k = 2*k+1;
                }
                else if((rval>=lval)&&(rval>key)){
                        NodePtr temp = cityHeap[k];
                        cityHeap[k] = cityHeap[2*k+2];
                        cityHeap[2*k+2] = temp;
                        k = 2*k+2;
                }
                else{
                        break;
                }
        }

        return ;
        // Downheap from position root
}

// REMOVE_MAX
Data_Node* remove_max() // returns pointer to maximum, restructures heap
{
        if(heapSize>0){
                NodePtr temp = cityHeap[0];
                cityHeap[0] = cityHeap[heapSize-1];
                cityHeap[heapSize-1] = temp;
                heapSize--;
                downHeap(0);
        }
        return cityHeap[heapSize];
       //Remove maximum element and return pointer to its data, restructuring the heap
}

// INSERT
void insert(Data_Node* item)
// Inserts item into heap citiHeap that has currently heapSize elements
{
        if(heapSize<MAX_CITIES){
                cityHeap[heapSize] = item;
                upHeap(heapSize);
                heapSize++;
        }
        return ;
        // Insert a pointer to data item into the heap.
}

void buildHeap() { //takes an array and builds a max heap out of it...

        int j;
        for(j = (heapSize-1)/2; j>=0; j--){
                downHeap(j);
        }
        return ;

}

//

//
//

/* DO NOT CHANGE THE MAIN FUNCTION */

int main( int argc, char *argv[] ) {
        /* A sample use of these functions.  Start with the empty tree,         */
        /* insert some stuff into it, and then delete it                        */
        int i=0;
        int height;
        clock_t start, end;
        double time;
        int index1, index2, count;
        FILE *fp;
        char list[1000];
        char city[150];
        char state[3];
        char zip[11];
        char a;
        int qcode;
        int z[10];
        int numCities=0;
        int countCities=0;
        int nqueries = 0;
        char outname[100] = "";

        Data_Node *datanode;


        start = clock();
        fp = fopen(argv[1], "r");

        strcpy(outname, argv[1]);
        strcat(outname, "_out");

        fp_out = fopen(outname, "w");

        count = 0;
        if(fp == NULL){
                printf("could not open file\n");
                return 0;
        }
        while (fgets(list, 999, fp)) { /* this continues until end of records*/
                if(numCities==0){
                        numCities=atoi(list); /* first line of input_file tells you how many entries to insert*/
                }
                else if(countCities < numCities){ /* read line and build a splay tree */
                        strcpy(city, ""); strcpy(state, ""); strcpy(zip, ""); /* clear old info */
                        index1 = 0;
                        index2 = 0;

                        a = list[index1]; /* copy city name until first tab */
                        while ((a != cr) && (a != lf)) {
                                while ((a != tab) && (a != cr) && (a != lf)) {
                                        city[index2++] = a;
                                        a = list[++index1];
                                }
                                city[index2] = es;
                                index2 = 0; a = list[++index1]; /* copy state name until next tab */
                                while ((a != tab) && (a != cr) && (a != lf)) {
                                        state[index2++] = a;
                                        a = list[++index1];
                                }
                                state[index2] = es;
                                index2 = 0; a = list[++index1];
                                /* copy zip until linefeed or carriage return */
                                while ((a != tab) && (a != cr) && (a != lf)) {
                                        zip[index2++] = a;
                                        a = list[++index1];
                                }
                                zip[index2] = es;
                        }
                        datanode = (Data_Node *)malloc(sizeof(Data_Node));

                        sscanf(zip, "%d", &qcode);
                        datanode->code = qcode;
                        strcpy(datanode->city, city);
                        strcpy(datanode->state, state);
                        strcpy(datanode->zip, zip);

                        /******************* put record pointer in heap array **********************/
                        cityHeap[count++] = datanode;
                        countCities++;
                        if(countCities == numCities){
                                end = clock();
                                time = (double)(end - start) / CLOCKS_PER_SEC;
                                fprintf(fp_out,"%f\n", (float)time);
                        }
                }
                else if(countCities == numCities){ /* Entries (for insertion) are followed by queries */
                        /* We want to read out the increment in positions that we will read out.  Extract K1, print, k2, print, ...
                        */
                        qcode = atoi(list);
                        z[i] = qcode;
                        i++;
                }
        }/* end while fgets */

        fclose(fp);
        // Note: count now has the heap size.  Should equal numCities here.
        heapSize = numCities;

        nqueries = i;

        int r;
        /*for(r=0;r<10;r++){
                printf("cityHeap[%d] = %d\n", r, cityHeap[r]->code);
        }*/

        start = clock();
        buildHeap();  // converts array into a Max Heap.


        /*(for(r=0;r<20;r++){
                fprintf(fp_out, "cityHeap[%d] = %d\n", r, cityHeap[r]->code);
        }*/

        for (i = 0; i < nqueries; i++) {
                for (int j = 0; j < z[i]; j++) {
                        datanode = remove_max();
                }
                if(datanode != NULL){
                        //printf("City remaining with %d largest zip code: %s %s %s \n", z[i], datanode->city, datanode->state, datanode->zip);
                        fprintf(fp_out, "City remaining with %d largest zip code: %s %s %s \n", z[i], datanode->city, datanode->state, datanode->zip);
                }
                /*********************** SEARCH ********************/
        }
        end = clock();
        time = (double)(end - start) / CLOCKS_PER_SEC;
        //printf("\n Time to do heap operations: %f\n", (float)time);
        //fprintf(fp_out, "Time to do heap operations: %f\n", (float)time);

        fclose(fp_out);
        return 0;
}

