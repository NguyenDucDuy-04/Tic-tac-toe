import 'dart:math';

import '../game_logic/check_result.dart';

// Minimax algorithm for tic-tac-toe AI
int minimax(List<List<String>> board, bool isMaximizing) {
  // Base cases
  if (checkWin(board, 'O')) {
    return 1;
  } else if (checkWin(board, 'X')) {
    return -1;
  } else if (checkDraw(board)) {
    return 0;
  }

  // Recursive cases
  if (isMaximizing) {
    int bestScore = -1000; // Initializing to a very low value
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        // Try placing 'O' in an empty cell
        if (board[i][j].isEmpty) {
          board[i][j] = 'O';
          int score = minimax(board, false); // Minimize opponent's score
          board[i][j] = ''; // Undo the move
          bestScore = max(score, bestScore); // Choose the maximum score
        }
      }
    }
    return bestScore;
  } else {
    int bestScore = 1000; // Initializing to a very high value
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        // Try placing 'X' in an empty cell
        if (board[i][j].isEmpty) {
          board[i][j] = 'X';
          int score = minimax(board, true); // Maximize AI's score
          board[i][j] = ''; // Undo the move
          bestScore = min(score, bestScore); // Choose the minimum score
        }
      }
    }
    return bestScore;
  }
}
