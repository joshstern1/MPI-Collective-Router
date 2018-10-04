// Copyright 2018 Joshua Stern jstern19@bu.edu
//
//// The goal is to implement a splay tree data base ...
//
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
struct Node {
	int code;
	char zip[12];
	char city[150];
	char state[6];
};

typedef struct tree_node Tree;
typedef struct tree_node {
	struct tree_node *left, *right;
	struct tree_node *parent;
	struct Node *data;
} *TreePtr;

int size;  /* number of nodes in the tree */
		   /* Not actually needed for any of the operations,
		   but will be used in output */


/* WRITE A SPLAY FUNCTioN */
Tree * splay(int code, Tree *t) {
	/* Splay, not requiring code to be in the tree t.
	   Returns a pointer to the root of the resulting tree*/

  while(t->parent != NULL){
    TreePtr grandparent = t->parent->parent;
    TreePtr parent = t->parent;


    if((t == parent->left)&&(grandparent == NULL)){
      //right rotation
      parent->left = t->right;
      if(t->right!=NULL){
        t->right->parent = parent;
      }
      t->right = parent;
      parent->parent = t;
      t->parent = NULL;
    }
    else if((t == parent->right)&&(grandparent == NULL)){
      //left rotation
      parent->right = t->left;
      if(t->left!=NULL){
        t->left->parent = parent;
      }
      t->left = parent;
      parent->parent = t;
      t->parent = NULL;
    }
    else if((t == parent->left)&&(parent == grandparent->left)){
      //right zig zig
      TreePtr temp = grandparent->parent;
      int x=0;
      if(temp!=NULL){
        if(grandparent==temp->left){
          x = 1;
        }
        else if(grandparent==temp->right){
          x = 2;
        }
      }
      grandparent->left = parent->right;
      if(parent->right!=NULL){
        parent->right->parent = grandparent;
      }
      grandparent->parent = parent;
      parent->right = grandparent;
      parent->left = t->right;
      if(t->right!=NULL){
        t->right->parent = parent;
      }
      parent->parent = t;
      t->right = parent;
      t->parent = temp;
      if(temp!=NULL){
        if(x==1){
          temp->left = t;
        }
        else if (x==2){
          temp->right = t;
        }
      }
    }
    else if ((t == parent->right)&&(parent == grandparent->right)){
      //left zig zig
      TreePtr temp = grandparent->parent;
      int x=0;
      if(temp!=NULL){
        if(grandparent==temp->left){
          x = 1;
        }
        else if(grandparent==temp->right){
          x = 2;
        }
      }
      grandparent->right = parent->left;
      if(parent->left!=NULL){
        parent->left->parent = grandparent;
      }
      grandparent->parent = parent;
      parent->left = grandparent;
      parent->right = t->left;
      if(t->left!=NULL){
        t->left->parent = parent;
      }
      parent->parent = t;
      t->left = parent;
      t->parent = temp;
      if(temp!=NULL){
        if(x==1){
          temp->left = t;
        }
        else if (x==2){
          temp->right = t;
        }
      }
    }
    else if ((t == parent->right)&&(parent == grandparent->left)){
      //zig zag
      TreePtr temp = grandparent->parent;
      int x=0;
      if(temp!=NULL){
        if(grandparent==temp->left){
          x = 1;
        }
        else if(grandparent==temp->right){
          x = 2;
        }
      }
      grandparent->left = t->right;
      if(t->right!=NULL){
        t->right->parent = grandparent;
      }
      grandparent->parent = t;
      parent->right = t->left;
      if(t->left != NULL){
        t->left->parent = parent;
      }
      parent->parent = t;
      t->left = parent;
      t->right = grandparent;
      t->parent = temp;
      if(temp!=NULL){
        if(x==1){
          temp->left = t;
        }
        else if (x==2){
          temp->right = t;
        }
      }
    }
    else if ((t == parent->left)&&(parent == grandparent->right)){
      //zig zag
      TreePtr temp = grandparent->parent;
      int x=0;
      if(temp!=NULL){
        if(grandparent==temp->left){
          x = 1;
        }
        else if(grandparent==temp->right){
          x = 2;
        }
      }
      grandparent->right = t->left;
      if(t->left!=NULL){
        t->left->parent = grandparent;
      }
      grandparent->parent = t;
      parent->left = t->right;
      if(t->right != NULL){
        t->right->parent = parent;
      }
      parent->parent = t;
      t->right = parent;
      t->left = grandparent;
      t->parent = temp;
      if(temp!=NULL){
        if(x==1){
          temp->left = t;
        }
        else if (x==2){
          temp->right = t;
        }
      }
    }
    else{
      break;
    }
  }

	return t;
}

/*  WRITE A SPLAY TREE INSERT FUNCTION */
Tree * insert(Data_Node *data, Tree *t) {
	/* Insert data into the tree t, unless it's already there.    */
	/* Return a pointer to the resulting tree.
	   Keep track of the total number of records in the tree in the global
	   variable size */

		 Tree * new;
		 new = (Tree *)malloc(sizeof(Tree));
		 if (new == NULL) {
		 	printf("Ran out of space\n");
		 	exit(1);
		 }

		 new->data = data;
		 new->left = NULL;
		 new->right = NULL;
		 new->parent = NULL;

		 if(t==NULL){
		 	t = new;
		  size++;
		  return t;
		 }
		 else{
		 	int myzip = data->code;
		  int treezip = t->data->code;
		  if(myzip>treezip){
		  	if(t->right!=NULL){
		    	free(new);
		      return insert(data, t->right);
		    }
		    else{
		    	new->parent = t;
		      t->right = new;
		      size++;
		      return splay(myzip, new);
		    }
		  }
		  else if(myzip<treezip){
		  	if(t->left!=NULL){
		    	free(new);
		      return insert(data, t->left);
		    }
		    else{
		    	new->parent = t;
		      t->left = new;
		      size++;
		      return splay(myzip, new);
		    }
		  }
		  else{
		  	TreePtr root = t;
		    while(root->parent!=NULL){
		    	root = root->parent;
		     }
		     free(new);
		     return root;
		  }
		 }
}


/*  WRITE A SPLAY TREE DELETE FUNCTION */
Tree * delete(int code, Tree * t) {
	/* Deletes record with key 'code' from the tree if it's there. */
	/* Return a pointer to the resulting tree.
	   Keep track of the total number of records in the tree in the
	   variable size */

	 	int test_code = t->data->code;
	 	if(test_code==code){
	 		size--;
	 	  TreePtr root = splay(0,t);
	 	  if(root->left != NULL){
	 	  	TreePtr max = root->left;
	 	    max->parent = NULL;
	 	    while(max->right!=NULL){
	 	    	max = max->right;
	 	    }
	 	    TreePtr max2 = splay(0, max);
	 	    max2->right = root->right;
	 	    if(root->right!=NULL){
	 	    	root->right->parent = max2;
	 	    }
				return max2;
	 	    //free(root);
	 	  }
	 	  else{
	 	  	TreePtr next = root->right;
	 	    next->parent = NULL;
	 	    //free(root);
	 	    return next;
	 	  }
	 	}
	 	else if ((test_code>code)&&(t->left != NULL)){
	 		return delete(code, t->left);
	 	}
	 	else if ((test_code<code)&&(t->right != NULL)){
	 		return delete(code, t->right);
	 	}
	 	else{

			TreePtr root = t;
	 	  while(root->parent!=NULL){
	 	  	root = root->parent;
	 	  }
	 		return root;
		}
}


/* function searchTree()
This function is used to search through tree and print out the zipcodes
that correspond to |zip(code)-z(i)| <= 10, where z(i) is the key value
that has been passed into the function.  The city, state, and zip is then
printed out.
*/

/* DO NOT CHANGE*/
void searchTree2(Tree *node, int key) {
	int test_code;
	if (node != NULL) {
		test_code = node->data->code;
		if ((key - test_code) < 10) searchTree2(node->left, key);
		if ((((test_code - key) <= 10) && ((test_code - key) >= 0))
			|| ((key - test_code) <= 10) && ((key - test_code) >= 0))
			fprintf(fp_out,"%s %s %s\n", node->data->city, node->data->state, node->data->zip);
		if ((test_code - key) < 10) searchTree2(node->right, key);
	}
}


/* function treeHeightht: computes the height of the root.  DO NOT CHANGE!
	*/
int treeHeight(Tree *node) {
	int left_height, right_height;
	if (node->left == NULL) {
		if (node->right == NULL) { // it's a leaf
			return 0;
		}
		else {
			return 1 + treeHeight(node->right);
		}
	}
	else {
		left_height = 1 + treeHeight(node->left);
		if (node->right == NULL) {
			return left_height;
		}
		else {
			right_height = 1 + treeHeight(node->right);
			if (right_height > left_height) {
				return right_height;
			}
			else return left_height;
		}
	}
}
//
//
//

/* DO NOT CHANGE THE MAIN FUNCTION */

int main( int argc, char *argv[] ) {
	/* A sample use of these functions.  Start with the empty tree,         */
	/* insert some stuff into it, and then delete it                        */
	Tree *root;
	int i;
	int height;
	root = NULL;              /* the empty tree */
	size = 0;
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

			/******************* INSERT **********************/
			root = insert(datanode, root);/* store dat anode into Splay tree.  */
			count++;
			countCities++;
			if(countCities == numCities){
				end = clock();
				time = (double)(end - start) / CLOCKS_PER_SEC;
				fprintf(fp_out,"%f\n", (float)time);
				height = treeHeight(root);
				/*************************** HEIGHT OF SPLAY TREE ******************/
				//fprintf(fp_out,"Height of resulting tree: %d \n", height);
				i=0;
			}
		}
		else if(countCities == numCities){ /* Entries (for insertion) are followed by queries */
			/* read "queries.txt" into an array, then compare all of the zipcodes
			   in "queries.txt" with the zipcodes of the tree, and print out the
			   zipcodes where |zip(code)- z(i)| <= 10
			*/
			qcode = atoi(list);
			z[i] = qcode;
			i++;
		}
	}/* end while fgets */

	fclose(fp);
	nqueries = i;
	start = clock();
	for (i = 0; i < nqueries; i++) {
		fprintf(fp_out,"\n\nCities within 10 of %d:\n", z[i]);
		/*********************** SEARCH ********************/
		searchTree2(root, z[i]);
	}
	end = clock();
	time = (double)(end - start) / CLOCKS_PER_SEC;

	/********** SIZE OF TREE BEFORE DELETION ********************/
	fprintf(fp_out,"size = %d\n", size);

	for (i = 0; i < nqueries; i++) {
		root = delete(z[i],root);
	}
	/********** SIZE OF TREE AFTER DELETION *******************/
	fprintf(fp_out,"size = %d\n", size);
	//fprintf(fp_out, "Height of final display tree: %d \n", treeHeight(root));
	fclose(fp_out);
	return 0;
}
